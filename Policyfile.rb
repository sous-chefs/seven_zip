# frozen_string_literal: true

name 'seven_zip'
default_source :supermarket

run_list 'test::default'

cookbook 'seven_zip', path: '.'
cookbook 'test', path: './test/fixtures/cookbooks/test'

named_run_list :default, 'test::default'
named_run_list :remove, 'test::remove'
