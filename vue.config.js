//module.exports = { publicPath: process.env.NODE_ENV === 'production' ? '/pikdrive-test/' : '/' }
chainWebpack: config => {
    config.optimization.delete('splitChunks')
  }