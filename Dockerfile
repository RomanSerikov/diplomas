FROM ruby:2.4.3-onbuild

EXPOSE 4567

CMD ["ruby", "./app.rb"]
