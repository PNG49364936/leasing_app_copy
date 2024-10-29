const path = require('path');

module.exports = {
    entry: './app/javascript/channels/index.js', // Met à jour le chemin vers votre fichier d'entrée
    output: {
        filename: 'bundle.js', // nom du fichier de sortie
        path: path.resolve(__dirname, 'dist'), // dossier de sortie
    },
    mode: 'development', // mode de développement
    module: {
        rules: [
            {
                test: /\.js$/, // traite les fichiers .js
                exclude: /node_modules/,
                use: {
                    loader: 'babel-loader', // si vous utilisez Babel
                },
            },
        ],
    },
};
