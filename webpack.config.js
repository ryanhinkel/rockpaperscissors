var webpack = require("webpack");

module.exports = {
    entry: "./src/js/app.js.coffee",
    output: {
        path: __dirname,
        filename: "bundle.js"
    },
    resolve: {
        extensions: ["", ".webpack.js", ".web.js", ".js", ".js.coffee"]
    },
    devtool: "source-map",
    module: {
        loaders: [
            { test: /\.coffee$/, loader: "coffee-loader" }
        ]
    },
    plugins: [
        new webpack.DefinePlugin({
            'process.env': {
              'NODE_ENV': JSON.stringify('production')
            }
        }),
        new webpack.optimize.UglifyJsPlugin({
            compress: {
                warnings: false
            },
            sourceMap: true
        })
    ],
};
