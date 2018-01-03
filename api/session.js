
const Sequelize = require('sequelize');

const {
  POSTGRES_USER,
  POSTGRES_PASSWORD,
  POSTGRES_DEV_DB,
  POSTGRES_TEST_DB,
  POSTGRES_PROD_DB
} = process.env;

const sequelize = new Sequelize(
  POSTGRES_DEV_DB, POSTGRES_USER, POSTGRES_PASSWORD, {
  host: 'localhost',
  dialect: 'postgres',

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
