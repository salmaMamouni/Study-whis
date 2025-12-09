/**
 * auth.js - Gestionnaire d'authentification Study-Whis
 * 
 * Gère l'authentification des utilisateurs sur Omeka-S
 * Affiche une modal de login avec formulaire
 * 
 * Usage:
 *   const auth = new auth({
 *       navbar: d3.select('#navbar'),
 *       apiOmk: 'http://localhost/omeka-s/api/',
 *       mail: 'user@example.com',
 *       ident: 'IDENTITY_KEY',
 *       key: 'API_KEY'
 *   });
 *   auth.getUser(function(user) {
 *       console.log('Utilisateur:', user);
 *   });
 */

import { omk } from './omk.js';

export class auth {
    constructor(params) {
        var me = this;

        // Paramètres
        this.modal;
        this.m;
        this.navbar = params.navbar ? params.navbar : null;
        this.apiOmk = params.apiOmk ? params.apiOmk : false;
        this.mail = params.mail ? params.mail : false;
        this.ident = params.ident ? params.ident : false;
        this.key = params.key ? params.key : false;
        this.omk = false;
        this.user = false;
        this.userAdmin = false;

        let iconIn = '<i class="bi bi-box-arrow-in-right"></i>';
        let iconOut = '<i class="bi bi-box-arrow-right"></i>';
        let btnLogin, nameLogin, alertAuth, alertMail, alertServer;

        /**
         * Initialisation : crée les éléments HTML de la navbar et modal
         */
        this.init = function () {
            // HTML de la navbar (utilise Bootstrap 5)
            let htmlNavBar = `
                <div class="d-flex align-items-center gap-2">
                    <span class="text-light">Utilisateur : <strong id="userLogin">Anonyme</strong></span>
                    <button id="btnLogin" title="Connexion Omeka" class="btn btn-sm btn-outline-light">
                        ${iconIn} Login
                    </button>
                </div>
            `;

            if (me.navbar) {
                me.navbar.innerHTML = htmlNavBar;
            }

            // HTML de la modal de login
            let htmlModal = `
                <div class="modal fade" id="modalAuth" tabindex="-1">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header bg-primary text-white">
                                <h5 class="modal-title">Connexion Study-Whis</h5>
                                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                            </div>
                            <div class="modal-body">
                                <div class="mb-3">
                                    <label for="authServer" class="form-label">Serveur Omeka</label>
                                    <input id="authServer" type="text" class="form-control" 
                                           placeholder="http://localhost/omeka-s/api/">
                                </div>

                                <div class="mb-3">
                                    <label for="authMail" class="form-label">Email</label>
                                    <input id="authMail" type="email" class="form-control" 
                                           placeholder="user@example.com">
                                </div>

                                <div class="mb-3">
                                    <label for="authIdent" class="form-label">Clé d'identité</label>
                                    <input id="authIdent" type="password" class="form-control" 
                                           placeholder="Votre clé d'identité Omeka">
                                </div>

                                <div class="mb-3">
                                    <label for="authPwd" class="form-label">Clé API</label>
                                    <input id="authPwd" type="password" class="form-control" 
                                           placeholder="Votre clé API Omeka">
                                </div>

                                <div id="alertAuth" class="alert alert-danger d-none" role="alert">
                                    <strong>Erreur d'authentification</strong>
                                    <p id='errorMessage' class='mb-0'>Les identifiants sont incorrects</p>
                                </div>

                                <div id="alertMail" class="alert alert-warning d-none" role="alert">
                                    <strong>Utilisateur non trouvé</strong>
                                    <p id='errorMessage' class='mb-0'>Cet email n'existe pas dans Omeka</p>
                                </div>

                                <div id="alertServer" class="alert alert-warning d-none" role="alert">
                                    <strong>Serveur indisponible</strong>
                                    <p id='errorMessage' class='mb-0'>Le serveur Omeka ne répond pas</p>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                                <button id='btnCheck' type="button" class="btn btn-primary">Vérifier</button>
                            </div>
                        </div>
                    </div>
                </div>
            `;

            // Ajouter la modal au DOM
            if (!document.getElementById('modalAuth')) {
                let modalContainer = document.createElement('div');
                modalContainer.innerHTML = htmlModal;
                document.body.appendChild(modalContainer);
            }

            // Initialiser Bootstrap Modal
            me.modal = new bootstrap.Modal('#modalAuth');

            // Récupérer les références aux éléments
            alertAuth = document.getElementById('alertAuth');
            alertMail = document.getElementById('alertMail');
            alertServer = document.getElementById('alertServer');
            nameLogin = document.getElementById('userLogin');
            btnLogin = document.getElementById('btnLogin');

            // Événements
            let inputs = document.querySelectorAll('#modalAuth input');
            inputs.forEach(input => {
                input.addEventListener('change', () => {
                    // Masquer les alertes quand l'utilisateur change les champs
                    alertAuth.classList.add('d-none');
                    alertMail.classList.add('d-none');
                    alertServer.classList.add('d-none');
                    me.mail = "";
                    me.ident = "";
                    me.key = "";
                    me.apiOmk = "";
                    me.user = false;
                });
            });

            // Clic sur le bouton login
            if (btnLogin) {
                btnLogin.addEventListener('click', () => {
                    if (btnLogin.innerHTML.includes(iconIn)) {
                        me.modal.show();
                    } else {
                        // Déconnexion
                        me.mail = "";
                        me.ident = "";
                        me.key = "";
                        me.apiOmk = "";
                        me.user = false;
                        me.omk = false;
                        nameLogin.textContent = 'Anonyme';
                        btnLogin.innerHTML = iconIn + ' Login';
                        btnLogin.classList.remove('btn-danger');
                        btnLogin.classList.add('btn-outline-light');
                    }
                });
            }

            // Clic sur le bouton "Vérifier"
            document.getElementById('btnCheck').addEventListener('click', () => {
                me.getUser();
            });
        };

        /**
         * Récupère et vérifie l'utilisateur
         */
        this.getUser = function (cb = null) {
            // Récupérer les valeurs du formulaire
            me.apiOmk = me.apiOmk || document.getElementById('authServer').value;
            me.mail = me.mail || document.getElementById('authMail').value;
            me.ident = me.ident || document.getElementById('authIdent').value;
            me.key = me.key || document.getElementById('authPwd').value;

            if (!me.mail || !me.ident || !me.key || !me.apiOmk) {
                alertAuth.classList.remove('d-none');
                if (cb) cb(me.user);
                return;
            }

            // Ajouter le / final si absent
            if (me.apiOmk && me.apiOmk.slice(-1) !== '/') {
                me.apiOmk += '/';
            }

            // Créer une instance OMK
            me.omk = new omk({
                'api': me.apiOmk,
                'key': me.key,
                'ident': me.ident,
                'mail': me.mail
            });

            // Vérifier l'utilisateur auprès d'Omeka
            me.omk.getUser(u => {
                if (!u) {
                    alertMail.classList.remove('d-none');
                    me.user = false;
                    me.omk = false;
                } else {
                    me.user = u;
                    me.userAdmin = me.user["o:role"] == 'global_admin';
                    me.user.id = me.user['o:id'];

                    if (nameLogin) {
                        nameLogin.textContent = me.user['o:name'];
                    }
                    if (btnLogin) {
                        btnLogin.innerHTML = iconOut + ' Logout';
                        btnLogin.classList.remove('btn-outline-light');
                        btnLogin.classList.add('btn-danger');
                    }

                    me.modal.hide();
                    
                    console.log('Utilisateur connecté:', me.user);
                }

                if (cb) cb(me.user);
            });
        };

        /**
         * Vérifie si l'utilisateur est connecté
         */
        this.isAuthenticated = function () {
            return me.user !== false && me.omk !== false;
        };

        /**
         * Déconnecte l'utilisateur
         */
        this.logout = function () {
            me.user = false;
            me.omk = false;
            me.mail = "";
            me.ident = "";
            me.key = "";
            me.apiOmk = "";
            
            if (nameLogin) nameLogin.textContent = 'Anonyme';
            if (btnLogin) {
                btnLogin.innerHTML = iconIn + ' Login';
                btnLogin.classList.remove('btn-danger');
                btnLogin.classList.add('btn-outline-light');
            }
        };

        // Initialisation
        this.init();
    }
}
