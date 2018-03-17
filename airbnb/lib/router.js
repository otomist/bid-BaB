Router.configure({
    layoutTemplate: 'layout'
});

Router.route('/', {name: 'jumbotron'});
Router.route('/spaceRental', {name: 'spaceRental'});
Router.route('/hosting', {name: 'makeListing'});
Router.route('/rental', {name: 'bidPage'});
Router.route('/houses', {name: 'houseList'});

var requireLogin = function() {
    if(!Meteor.user()) {
        this.render('accessDenied');
    } else {
        this.next();
    }
};

Router.onBeforeAction(requireLogin, {except: 'jumbotron'});
