const emojis = require('./emoji.json')

console.log('EMOJIS=('+emojis.filter((_, i) => i > 2000 && i < 4000).map(_ => _.char).reduce((acc, cur) => acc + ' ' + cur, '') + ')')
