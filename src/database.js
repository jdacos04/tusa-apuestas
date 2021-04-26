const  postgres =require('pg')
const {promisify} =require('util');


const pool =new postgres.Pool({

    user: 'postgres',
    host: 'localhost',
    password: 'princho4',
    database: 'tusa',
    port: '5432'
});
//promisify pool querys
pool.query=promisify(pool.query);

module.exports = pool;