Router.configure({
    layoutTemplate: 'layout'
});

Router.route('/', {name: 'jumbotron'});
Router.route('/rental', {name: 'spaceRental'});
//Router.route('/', {name: ''});

var requireLogin = function() {
    if(!Meteor.user()) {
        this.render('accessDenied');
    } else {
        this.next();
    }
};

Router.onBeforeAction(requireLogin, {except: 'jumbotron'});
