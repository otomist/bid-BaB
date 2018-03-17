Router.configure({
    layoutTemplate: 'layout'
});

Router.route('/', {name: 'jumbotron'});
Router.route('/rental', {name: 'space'});

var requireLogin = function() {
    if(!Meteor.user()) {
        this.render('accessDenied');
    } else {
        this.next();
    }
};

Router.onBeforeAction(requireLogin, {except: 'jumbotron'});
