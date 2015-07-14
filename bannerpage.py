import jinja2
import os
import webapp2
import time	

from google.appengine.api import users
from google.appengine.ext import ndb


# We set a parent key on the 'Greetings' to ensure that they are all in the same
# entity group. Queries across the single entity group will be consistent.
# However, the write rate should be limited to ~1/second.


jinja_environment = jinja2.Environment(
    loader=jinja2.FileSystemLoader(os.path.dirname(__file__)),
    extensions=['jinja2.ext.autoescape'],
    autoescape=True)


class MainPage(webapp2.RequestHandler):
    def get(self):
        template = jinja_environment.get_template('index.html')
        self.response.out.write(template.render())
	self.redirect('http://www.amdgtechnologies.info')	
    
    def getInfo(self):
	time.sleep(3)

application = webapp2.WSGIApplication([
    ('/', MainPage),
], debug=True)


#application.getInfo()
