/**
 * authParams.js - Paramètres d'authentification Study-Whis
 * Configuration des credentials Omeka-S et clés API
 */

export const swParams = {
    // Configuration Omeka-S
    navbar: null, // sera rempli plus tard si besoin
    mail: 'samuel.szoniecky@univ-paris8.fr', // Email admin Omeka-S
    apiOmk: 'http://localhost/omk_thyp_25-26_clone/api/', // URL API Omeka-S

    // Clés Omeka-S
    ident: 'BwGgF5D4RQL36jy0u8H37i1vmcopffaa',   // Identity key Omeka-S
    key: 'qRNGNuUExBpKN3nmiqSPcz91969Wd8ko',     // API key Omeka-S

    // Configuration Whisper API (à compléter si tu l'utilises)
    whisperKey: '', // mets ici ta clé OpenAI / Whisper si tu en as une

    // Configuration Ollama (IA locale)
    ollamaEndpoint: 'http://localhost:11434/api/',
    ollamaModel: 'gpt-oss:120b-cloud',

    // Configuration Study-Whis
    studyWhisVocab: 'sw',    // préfixe vocabulaire Study-Whis
    defaultLanguage: 'fr',   // langue par défaut
    maxUploadSize: 500,      // taille max upload en MB
};

/**
 * Exportation compatible avec ancien format
 */
export const pa = {
    ...swParams,
    keyGitHub: '' // Optionnel : GitHub token si tu en as besoin
};
