Router.configure({
    layoutTemplate: 'layout'
});

Router.route('/', {name: 'jumbotron'});
<<<<<<< HEAD
Router.route('/rental', {name: 'spaceRental'});
//Router.route('/', {name: ''});
=======
Router.route('/rental', {name: 'bidPage'});
>>>>>>> d4f2e4437fa3b211f800d4f73beb391d12a6bb72

var requireLogin = function() {
    if(!Meteor.user()) {
        this.render('accessDenied');
    } else {
        this.next();
    }
};

Router.onBeforeAction(requireLogin, {except: 'jumbotron'});
