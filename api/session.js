
const Sequelize = require('sequelize');
const Op = Sequelize.Op;

const dbenv = process.env.NODE_ENV.toLowerCase();
const config = require(__dirname + '/config/config.js')[dbenv];

const sequelize = new Sequelize(
  config.database, config.username, config.password, {
  host: config.host,
  dialect: config.dialect,

  pool: {
    max: 5,
    min: 0,
    acquire: 30000,
    idle: 10000
  }
});

sequelize
  .authenticate()
  .then(() => {
    console.log('Connection has been established successfully.');
  })
  .catch(err => {
    console.error('Unable to connect to the database:', err);
  });

module.export = {
  db: sequelize
}
