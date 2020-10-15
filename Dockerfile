# Use the official lightweight Ruby image.
# https://hub.docker.com/_/ruby
FROM ruby:2.6-slim

# Install production dependencies.
WORKDIR /usr/src/app
COPY Gemfile ./
ENV BUNDLE_FROZEN=false
RUN gem install bundler && bundle install

# Copy local code to the container image.
COPY . ./

# Expose 8080
EXPOSE 8080

# Run the web service on container startup.
CMD ["ruby", "./app.rb"]