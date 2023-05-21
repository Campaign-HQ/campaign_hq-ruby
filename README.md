# CampaignHQ

An API client for the [CampaignHQ](https://www.campaignhq.co) email marketing service, allowing
you to create/view/update/destroy lists and contacts.

For more information on how to set up your account, read the [API docs](https://campaignhq.docs.apiary.io/).

**NOTE:** This gem is in beta, tests are still being written
but most of the logic is there.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'campaign_hq', require: 'campaign_h_q'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install campaign_hq

## Usage

First, configure the `CampaignHQ` library so it can be used with your
account. After obtaining your API key, add the following before your
application is initialized. For Rails apps, this might be
**config/initializers/campaign_hq.rb**

```ruby
CampaignHQ.configure do |config|
  config.api_key = 'your-campaign-hq-api-key'
end
```

You can now perform CRUD actions on the various resources that the API
provides.

Below is a short summary of what you can do with the library.

### Creating a new list

```ruby
list = CampaignHQ::List.create name: 'Newsletter'
```

### Adding or updating a contact in that list

```ruby
contact = CampaignHQ::Contact.create(list.id,
  first_name: 'John',
  last_name: 'Doe',
  email: 'john.doe@example.com',
  subscribed: true,
  custom_fields: {
    country: 'US'
  }
)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies.
Then, run `rake test` to run the tests. You can also run `bin/console`
for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

To release a new version, update the version number in `version.rb`, and then
run `bundle exec rake release`, which will create a git tag for the version,
push git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Campaign-HQ/campaign_hq-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/Campaign-HQ/campaign_hq-ruby/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the CampaignHQ project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Campaign-HQ/campaign_hq-ruby/blob/main/CODE_OF_CONDUCT.md).
