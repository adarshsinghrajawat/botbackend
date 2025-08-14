const { Pool } = require('pg');

const pool = new Pool({
    host: 'localhost',
    port: 5432,          
    user: 'postgres',    
    password: '123',     
    database: 'bot',    
    max: 100             
});

pool.connect((err, client, release) => {
    if (err) {
        return console.error('Error acquiring client', err.stack);
    }
    console.log('Connected to PostgreSQL');
    release();
});


module.exports = pool;
