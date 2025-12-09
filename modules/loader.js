/**
 * loader.js - Gestionnaire du loader/spinner
 * Affiche/masque un spinner durant les opérations asynchrones
 * 
 * Usage:
 *   const loader = new loader();
 *   loader.show();
 *   // ... opération asynchrone
 *   loader.hide();
 */

export class loader {
    constructor(params = {}) {
        var me = this;
        var main, loading, curwait = 0;

        /**
         * Initialise le loader HTML et CSS
         */
        this.init = function () {
            // HTML du spinner
            let html = `
            <div class="loadingio-spinner-double-ring-4dols36ufwg" id="sw-loading">
                <div class="ldio-6pd26u1x99x">
                    <div></div>
                    <div></div>
                    <div>
                        <div></div>
                    </div>
                    <div>
                        <div></div>
                    </div>
                </div>
            </div>
            `;

            // CSS du spinner
            let css = `
            <style>
                @keyframes ldio-6pd26u1x99x {
                    0% { transform: rotate(0deg); }
                    50% { transform: rotate(180deg); }
                    100% { transform: rotate(360deg); }
                }
                .loadingio-spinner-double-ring-4dols36ufwg {
                    width: 50px;
                    height: 50px;
                    display: none;
                    overflow: hidden;
                    background: transparent;
                    position: fixed;
                    top: 50%;
                    left: 50%;
                    transform: translate(-50%, -50%);
                    z-index: 9999;
                }
                .loadingio-spinner-double-ring-4dols36ufwg > div:nth-child(1) {
                    position: absolute;
                    border: 4px solid #ff7a59;
                    opacity: 1;
                    border-radius: 50%;
                    animation: ldio-6pd26u1x99x 1s cubic-bezier(0, 0.2, 0.8, 1) infinite;
                }
                .loadingio-spinner-double-ring-4dols36ufwg > div:nth-child(1) > div {
                    position: absolute;
                    width: 4px;
                    height: 4px;
                    top: -17px;
                    left: 15px;
                    background: #ff7a59;
                    border-radius: 50%;
                    box-shadow: 0 34px 0 rgba(255, 122, 89, 0.1);
                }
                .loadingio-spinner-double-ring-4dols36ufwg {
                    background: rgba(0, 0, 0, 0.3);
                }
            </style>
            `;

            // Ajouter le loader au DOM
            if (!document.getElementById('sw-loading-container')) {
                let container = document.createElement('div');
                container.id = 'sw-loading-container';
                container.innerHTML = css + html;
                document.body.appendChild(container);
                loading = document.getElementById('sw-loading');
            } else {
                loading = document.getElementById('sw-loading');
            }
        };

        /**
         * Affiche le loader
         */
        this.show = function () {
            if (loading) {
                loading.style.display = 'block';
            }
            curwait++;
        };

        /**
         * Masque le loader
         */
        this.hide = function (all = false) {
            if (all) curwait = 0;
            else curwait--;

            if (curwait < 1 && loading) {
                loading.style.display = 'none';
                curwait = 0;
            }
        };

        // Initialisation
        this.init();
    }
}
