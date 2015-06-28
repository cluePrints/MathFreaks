require 'rubygems'
require 'gnuplot' 

Gnuplot.open do |gp|
  Gnuplot::Plot.new( gp ) do |plot|

    plot.xrange "[-10:10]"
    plot.yrange "[-10:10]"
    plot.title  "Inverse Function Example"
    plot.ylabel "x"
    plot.xlabel "y"

    my_func = lambda { |x| x**2 }

    x = (-10..10).collect { |v| v.to_f }
    y = x.collect { |v| my_func[v] }

    f_graph       = [x, y] # you see the trick, right?
    inverse_graph = [y, x]

    plot.data = [ 
      Gnuplot::DataSet.new( f_graph ) { |ds|
        ds.with = "lines"
        ds.linewidth = 4
        ds.title = "f"
      },
      Gnuplot::DataSet.new( inverse_graph ) { |ds|
        ds.with = "lines"
        ds.linewidth = 4
        ds.title = "f^(-1)"
      }
    ]
  end
end

