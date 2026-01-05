const express = require('express');
const app = express();

app.use('/public', express.static('public'));


app.get('/', function(req, res){
    res.sendfile('kenpark.html', { root: __dirname  } );
});

app.get('/exodus.html', function(req, res){
  res.sendfile('exodus.html', { root: __dirname  } );
});

app.get('/popomint.html', function(req, res){
  res.sendfile('popomint.html', { root: __dirname  } );
});

// Listen to the App Engine-specified port, or 8080 otherwise
const PORT = process.env.PORT || 8080;
app.listen(PORT, () => {
  console.log(`Server listening on port ${PORT}...`);
});