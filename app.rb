require_relative 'config/environment'

class App < Sinatra::Base
  get "/reversename/:name" do
    @name_reversed = params[:name].reverse
    "#{@name_reversed}"
  end

  get "/square/:number" do
    @squared = params[:number].to_i * params[:number].to_i
    "#{@squared}"
  end

  get "/say/:number/:phrase" do
    @phrase_n_times = "#{params[:phrase]}"
    params[:number].to_i.times do
      @phrase_n_times += "\n#{params[:phrase]}"
    end
    "#{@phrase_n_times}"
  end

  get "/say/:word1/:word2/:word3/:word4/:word5" do
    @phrase_concat = params.values[2...params.length].join(" ") + "."
    "#{@phrase_concat}"
  end

  get "/:operation/:number1/:number2" do
    if params[:operation] == "add"
      "#{params[:number1].to_i + params[:number2].to_i}"
    elsif params[:operation] == "subtract"
      "#{params[:number1].to_i - params[:number2].to_i}"
    elsif params[:operation] == "multiply"
      "#{params[:number1].to_i * params[:number2].to_i}"
    elsif params[:operation] == "divide"
      "#{params[:number1].to_i / params[:number2].to_i}"
    else
      "Error"
    end
  end

end
