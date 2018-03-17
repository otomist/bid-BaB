Router.configure({
    layoutTemplate: 'layout'
});

Router.route('/', {name: 'jumbotron'});


var requireLogin = function() {
    if(!Meteor.user()) {
        this.render('accessDenied');
    } else {
        this.next();
    }
};

Router.onBeforeAction(requireLogin, {only: 'jumbotron'});
