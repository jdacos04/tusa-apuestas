const  postgres =require('pg')
const {promisify} =require('util');


// const pool =new postgres.Pool({

//     user: 'postgres',
//     host: 'localhost',
//     password: 'princho4',
//     database: 'tusa',
//     port: '5432'
// });
// //promisify pool querys
// pool.query=promisify(pool.query);


const pool =new postgres.Pool({

    user: 'vjypcjgeilqtsr',
    host: 'ec2-54-224-120-186.compute-1.amazonaws.com',
    password: 'princho4',
    database: '58c7e8d3c822f66797f666f9eaa90b908d7402d3115523ce04088ee7563b4536',
    port: '5432'
});
//promisify pool querys
pool.query=promisify(pool.query);

module.exports = pool;