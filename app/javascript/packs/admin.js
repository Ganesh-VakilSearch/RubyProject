// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import '@rails/ujs'
import Turbolinks from "turbolinks"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import $ from 'jquery';
global $ = jQuery;

import "bootstrap";

import "./plugins/jquery.easing.min"
import "./plugins/sb-admin-2.min"
import "./plugins/Chart.min"
import "./plugins/chart-area-demo"
import "./plugins/chart-pie-demo"
//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap
//= require_tree .
