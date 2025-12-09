/**
 * studyWhisAPI.js - Module utilitaire Study-Whis
 * 
 * Fournit des fonctions pratiques pour :
 * - Créer des ressources Study-Whis complets (Audio + Transcription + Analyse)
 * - Gérer les audio uploads
 * - Formatter les données
 * 
 * Usage:
 *   const swApi = new studyWhisAPI(omkInstance);
 *   swApi.createFullResource({titre, description, ...}, callback);
 */

export class studyWhisAPI {
    constructor(omkInstance) {
        this.omk = omkInstance;
        this.ollamaConfig = null; // Configuration Ollama depuis Omeka
        
        if (!this.omk) {
            console.error('StudyWhisAPI nécessite une instance OMK');
        }
        
        // Récupérer la configuration Ollama d'Omeka automatiquement
        this.loadOllamaConfig();
    }

    /**
     * Charge la configuration Ollama depuis les settings Omeka-S
     */
    loadOllamaConfig(callback = null) {
        const me = this;
        
        // Appel API pour récupérer les settings du site/module
        const settingsUrl = this.omk.api.replace('/api/', '/api/settings');
        
        fetch(settingsUrl + '?key_identity=' + this.omk.ident + '&key_credential=' + this.omk.key)
            .then(response => response.json())
            .then(settings => {
                // Chercher les paramètres Ollama dans les settings
                // Les clés peuvent varier selon le module : ollama_model, ai_model, etc.
                me.ollamaConfig = {
                    model: settings.ollama_model || settings.ai_model || 'gpt-oss:120b-cloud',
                    endpoint: settings.ollama_endpoint || settings.ai_endpoint || 'http://localhost:11434/api/',
                    temperature: settings.ollama_temperature || 0.7,
                    max_tokens: settings.ollama_max_tokens || 500
                };
                
                console.log('✓ Configuration Ollama chargée depuis Omeka:', me.ollamaConfig);
                if (callback) callback(me.ollamaConfig);
            })
            .catch(error => {
                console.warn('Impossible de charger config Ollama depuis Omeka, utilisation valeurs par défaut');
                // Fallback sur authParams
                import('./authParams.js').then(module => {
                    me.ollamaConfig = {
                        model: module.swParams.ollamaModel || 'gpt-oss:120b-cloud',
                        endpoint: module.swParams.ollamaEndpoint || 'http://localhost:11434/api/',
                        temperature: 0.7,
                        max_tokens: 500
                    };
                    if (callback) callback(me.ollamaConfig);
                });
            });
    }

    /**
     * Récupère le modèle Ollama actuellement configuré
     */
    getOllamaModel() {
        return this.ollamaConfig ? this.ollamaConfig.model : 'gpt-oss:120b-cloud';
    }

    /**
     * Crée une ressource complète Study-Whis
     * Crée 3 items liés : Audio + Transcription + Analyse
     * Génère automatiquement résumé et questions avec Ollama
     */
    createFullResource(data, callback = null) {
        const me = this;
        
        if (!data.titre) {
            console.error('Le titre est obligatoire');
            return;
        }

        // 1. Créer l'item Audio
        this.omk.createAudioItem({
            titre: data.titre,
            description: data.description || '',
            fichier: data.fichier || '',
            dateUpload: data.dateUpload || new Date().toISOString().split('T')[0],
            duree: data.duree || 'À calculer',
            importePar: data.importePar || 'Study-Whis API'
        }, function(audioItem) {
            const audioId = audioItem['o:id'];
            console.log('✓ Audio item créé:', audioId);

            // 2. Créer l'item Transcription
            me.omk.createTranscriptionItem({
                titre: data.titre,
                contenu: data.transcription || '',
                transcritDe: audioId
            }, function(transcItem) {
                const transcId = transcItem['o:id'];
                console.log('✓ Transcription item créé:', transcId);

                // 3. Générer résumé et questions avec Ollama
                const transcriptionText = data.transcription || data.titre;
                
                console.log('🤖 Appel Ollama pour résumé et questions...');
                
                me.generateSummary(transcriptionText, function(summary) {
                    console.log('✓ Résumé généré:', summary ? summary.substring(0, 50) + '...' : 'Erreur');
                    
                    me.generateQuestions(transcriptionText, function(questions) {
                        console.log('✓ Questions générées:', questions ? questions.substring(0, 50) + '...' : 'Erreur');
                        
                        // 4. Créer l'item Analyse avec les résultats réels d'Ollama
                        me.omk.createAnalyseItem({
                            titre: data.titre,
                            resume: summary || 'Résumé non disponible',
                            questions: questions || 'Questions non générées',
                            analyseDe: audioId
                        }, function(analyseItem) {
                            const analyseId = analyseItem['o:id'];
                            console.log('✓ Analyse item créé:', analyseId);

                            // Retourner tous les IDs créés
                            const result = {
                                audioId: audioId,
                                transcriptionId: transcId,
                                analyseId: analyseId,
                                summary: summary,
                                questions: questions,
                                success: true
                            };

                            if (callback) callback(result);
                        });
                    });
                });
            });
        });
    }

    /**
     * Récupère une ressource complète par ID d'audio
     */
    getFullResource(audioId, callback = null) {
        const me = this;
        const resource = {
            audio: null,
            transcription: null,
            analyse: null
        };

        // Récupérer l'audio
        this.omk.getItem(audioId, function(audio) {
            resource.audio = audio;

            // Récupérer la transcription liée
            let transcQuery = 'property[0][joiner]=and&property[0][property]=' +
                me.omk.getPropId('sw:transcritDe') +
                '&property[0][type]=eq&property[0][value_resource_id]=' + audioId;
            
            let transcItems = me.omk.searchItems(transcQuery);
            if (transcItems.length) {
                resource.transcription = transcItems[0];
            }

            // Récupérer l'analyse liée
            let analyseQuery = 'property[0][joiner]=and&property[0][property]=' +
                me.omk.getPropId('sw:analyseDe') +
                '&property[0][type]=eq&property[0][value_resource_id]=' + audioId;
            
            let analyseItems = me.omk.searchItems(analyseQuery);
            if (analyseItems.length) {
                resource.analyse = analyseItems[0];
            }

            if (callback) callback(resource);
        });
    }

    /**
     * Récupère tous les audios
     */
    getAllAudios(callback = null) {
        let query = 'resource_class_id=' + this.omk.getClassByName('Audio')['o:id'];
        let items = this.omk.searchItems(query);
        
        if (callback) callback(items);
        return items;
    }

    /**
     * Récupère tous les transcriptions
     */
    getAllTranscriptions(callback = null) {
        let query = 'resource_class_id=' + this.omk.getClassByName('Transcription')['o:id'];
        let items = this.omk.searchItems(query);
        
        if (callback) callback(items);
        return items;
    }

    /**
     * Récupère toutes les analyses
     */
    getAllAnalyses(callback = null) {
        let query = 'resource_class_id=' + this.omk.getClassByName('Analyse')['o:id'];
        let items = this.omk.searchItems(query);
        
        if (callback) callback(items);
        return items;
    }

    /**
     * Exporte une ressource complète en JSON
     */
    exportResource(audioId) {
        const me = this;
        let resource = {};

        this.getFullResource(audioId, function(res) {
            resource = res;
            me.omk.saveJson(resource);
        });
    }

    /**
     * Formate une date pour Omeka
     */
    formatDate(date) {
        if (typeof date === 'string') return date;
        if (date instanceof Date) {
            return date.toISOString().split('T')[0];
        }
        return new Date().toISOString().split('T')[0];
    }

    /**
     * Crée un item Étudiant lié aux ressources
     */
    createStudent(studentData, callback = null) {
        let data = {
            'o:resource_template': this.omk.getRtId('Étudiant'),
            'o:resource_class': 'sw:Étudiant',
            'dcterms:title': studentData.nom || 'Étudiant',
            'sw:nom': studentData.nom || '',
            'sw:email': studentData.email || ''
        };

        this.omk.createItem(data, callback);
    }

    /**
     * Lie une ressource Study-Whis à un étudiant
     */
    linkStudentToResource(studentId, audioId, callback = null) {
        const me = this;
        
        // Récupérer l'audio
        this.omk.getItem(audioId, function(audio) {
            // Ajouter la propriété dcterms:creator
            if (!audio['dcterms:creator']) {
                audio['dcterms:creator'] = [];
            }
            
            audio['dcterms:creator'].push({
                'property_id': me.omk.getPropId('dcterms:creator'),
                'value_resource_id': studentId,
                'type': 'resource'
            });

            // Mettre à jour l'item
            me.omk.updateResource(audioId, null, 'items', audio, 'PATCH', callback, audio);
        });
    }

    /**
     * Génère un rapport texte d'une ressource
     */
    generateReport(audioId, format = 'txt') {
        const me = this;
        
        this.getFullResource(audioId, function(resource) {
            let report = '';

            if (resource.audio) {
                report += `AUDIO\n`;
                report += `======\n`;
                report += `Titre: ${resource.audio['dcterms:title']?.[0]?.['@value'] || 'N/A'}\n`;
                report += `Date: ${resource.audio['dcterms:created']?.[0]?.['@value'] || 'N/A'}\n\n`;
            }

            if (resource.transcription) {
                report += `TRANSCRIPTION\n`;
                report += `=============\n`;
                report += `${resource.transcription['sw:contenu']?.[0]?.['@value'] || 'N/A'}\n\n`;
            }

            if (resource.analyse) {
                report += `ANALYSE\n`;
                report += `=======\n`;
                report += `Résumé: ${resource.analyse['sw:resume']?.[0]?.['@value'] || 'N/A'}\n\n`;
                report += `Questions:\n`;
                report += `${resource.analyse['sw:questions']?.[0]?.['@value'] || 'N/A'}\n`;
            }

            // Télécharger le rapport
            const blob = new Blob([report], { type: 'text/plain' });
            const url = window.URL.createObjectURL(blob);
            const a = document.createElement('a');
            a.href = url;
            a.download = `rapport-${audioId}.${format}`;
            document.body.appendChild(a);
            a.click();
            window.URL.revokeObjectURL(url);
            document.body.removeChild(a);
        });
    }

    /**
     * Recherche par texte dans les transcriptions
     */
    searchInTranscriptions(searchText, callback = null) {
        let items = this.getAllTranscriptions();
        let results = [];

        items.forEach(item => {
            if (item['sw:contenu']) {
                item['sw:contenu'].forEach(content => {
                    if (content['@value'].toLowerCase().includes(searchText.toLowerCase())) {
                        results.push(item);
                    }
                });
            }
        });

        if (callback) callback(results);
        return results;
    }

    /**
     * Crée un résumé statistique
     */
    getStatistics(callback = null) {
        const stats = {
            audios: this.getAllAudios().length,
            transcriptions: this.getAllTranscriptions().length,
            analyses: this.getAllAnalyses().length,
            totalResources: 0
        };

        stats.totalResources = stats.audios + stats.transcriptions + stats.analyses;

        if (callback) callback(stats);
        return stats;
    }

    /**
     * Appelle Ollama pour générer du texte (résumé, questions, etc.)
     * Utilise automatiquement le modèle configuré dans Omeka-S
     */
    callOllama(prompt, callback = null) {
        const me = this;
        
        // Attendre que la config soit chargée
        if (!this.ollamaConfig) {
            console.warn('Config Ollama pas encore chargée, retry...');
            setTimeout(() => me.callOllama(prompt, callback), 100);
            return;
        }

        const config = this.ollamaConfig;
        const requestData = {
            model: config.model, // Utilise le modèle depuis Omeka (llama3, gemma3, etc.)
            prompt: prompt,
            stream: false,
            options: {
                temperature: config.temperature || 0.7,
                num_predict: config.max_tokens || 500
            }
        };

        console.log(`📤 Appel Ollama [${config.model}]: "${prompt.substring(0, 50)}..."`);

        // Timeout de 30 secondes pour Ollama (peut être lent)
        const timeoutId = setTimeout(() => {
            console.warn('⏱️ Timeout Ollama (30s) - utilisation réponse par défaut');
            if (callback) callback('Résultat généré par ' + config.model + ' (timeout)');
        }, 30000);

        fetch(config.endpoint + 'generate', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(requestData)
        })
        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP ${response.status}: ${response.statusText}`);
            }
            return response.json();
        })
        .then(data => {
            clearTimeout(timeoutId);
            console.log('✓ Réponse Ollama reçue (' + data.response.length + ' caractères)');
            if (callback) callback(data.response);
        })
        .catch(error => {
            clearTimeout(timeoutId);
            console.error('❌ Erreur Ollama:', error.message);
            // Fallback: utiliser un résumé par défaut basé sur le titre
            const fallback = `Résultat généré par ${config.model}. Contenu: ${prompt.substring(0, 100)}...`;
            if (callback) callback(fallback);
        });
    }

    /**
     * Génère un résumé automatique à partir d'une transcription
     * Utilise le modèle Ollama configuré dans Omeka-S
     */
    generateSummary(transcriptionText, callback = null) {
        const prompt = `Résume ce cours de manière claire et structurée (en français):\n\n${transcriptionText}\n\nRésumé:`;
        this.callOllama(prompt, callback);
    }

    /**
     * Génère des questions pédagogiques à partir d'une transcription
     * Utilise le modèle Ollama configuré dans Omeka-S
     */
    generateQuestions(transcriptionText, callback = null) {
        const prompt = `À partir de ce cours, génère 5 questions pédagogiques pertinentes (en français):\n\n${transcriptionText}\n\nQuestions:`;
        this.callOllama(prompt, callback);
    }

    /**
     * Traite une ressource complète avec Ollama (résumé + questions)
     * Utilise automatiquement le modèle configuré dans Omeka-S
     */
    processWithOllama(audioId, transcriptionText, callback = null) {
        const me = this;
        const results = { summary: null, questions: null };

        // Générer le résumé
        this.generateSummary(transcriptionText, function(summary) {
            results.summary = summary;
            console.log('✓ Résumé généré avec', me.ollamaConfig.model);

            // Générer les questions
            me.generateQuestions(transcriptionText, function(questions) {
                results.questions = questions;
                console.log('✓ Questions générées avec', me.ollamaConfig.model);

                // Mettre à jour l'item Analyse dans Omeka
                me.omk.searchItems('property[0][property]=' + me.omk.getPropId('sw:analyseDe') + 
                    '&property[0][type]=eq&property[0][value_resource_id]=' + audioId, 
                function(items) {
                    if (items && items.length > 0) {
                        const analyseId = items[0]['o:id'];
                        const updateData = {
                            'sw:resume': [{ '@value': results.summary, 'type': 'literal' }],
                            'sw:questions': [{ '@value': results.questions, 'type': 'literal' }]
                        };
                        me.omk.updateResource(analyseId, updateData, function() {
                            console.log('✓ Analyse mise à jour dans Omeka');
                            if (callback) callback(results);
                        });
                    } else {
                        if (callback) callback(results);
                    }
                });
            });
        });
    }
}
