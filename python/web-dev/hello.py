def application(environ, start_response):
    start_response('200 OK', [('Content-Type', 'text/html')])
    #return '<h1>Hello, NCIC,ICT,CAS!</h1>'
    return '<h1> %s!</h1>' % (environ['PATH_INFO'][1:] or 'NCIC,ICT,CAS')
