
const Sequelize = require('sequelize');
const Op = Sequelize.Op;

const config = require('config/config');
const dbenv = process.env.NODE_ENV.toLowerCase();
const opts = config[dbenv];

const sequelize = new Sequelize(
  opts.database, opts.username, opts.password, {
  host: opts.host,
  dialect: opts.dialect,

  operatorsAliases: {
    $and: Op.and
  },

  pool: {
    max: 5,
    min: 0,
    acquire: 30000,
    idle: 10000
  }
});

modules.export = {
  db: sequelize
}
