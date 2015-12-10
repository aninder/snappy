FactoryGirl.module_eval do
  class << self
    def fuzz
      #remove deprecation warnings from the log
      if !$stderr.is_a?StringIO
        stderr = $stderr
        $stderr = StringIO.new('', 'w')
      end
      FFaker.const_get(FFaker.constants.sample).instance_eval do
        if is_a?String
          return self
        end
        if is_a?Array
          return sample
        end
        m = instance_methods(false).sample
        if((methods.include?m) && (method(m).parameters.empty?||method(m).parameters.first.first == :opt))
          send(m){}
        else
          FactoryGirl.fuzz
        end
      end
    ensure
      $stderr = stderr if stderr
    end
    def fuzz_without_nil_values
      val = fuzz
      val==nil ? fuzz_without_nil_values : val
    end
    def fuzz_without_boolean_and_nil_values
      val = fuzz_without_nil_values
      ([true,false].include?val) ? fuzz_without_boolean_and_nil_values : val
    end
  end
end

# def fuzz
#     #remove deprecation warnings
#   if !$stderr.is_a?StringIO
#     stderr = $stderr
#     $stderr = StringIO.new('', 'w')
#   end
#   FFaker.const_get(FFaker.constants.sample).instance_eval do
#     if is_a?String
#       return self
#     end
#     if is_a?Array
#       return sample
#     end
#     m = instance_methods(false).sample
#     if((methods.include?m) && (method(m).parameters.empty?||method(m).parameters.first.first == :opt))
#       ss = send(m){}
#       if ss != nil
#         return ss
#       else
#         TOPLEVEL_BINDING.eval("self").send(:prob,"#{self}----#{m}")
#       end
#     else
#       fuzz
#     end
#   end
#   ensure
#     $stderr = stderr if stderr
# end




# TOPLEVEL_BINDING.eval("self").send(:prob,"#{self}----#{m}")
# prob <<  "#{self}----#{m}"

# def get_all_module_methods_with_arguments modules
#   modules.each { |m|
#     mod = FFaker.const_get(m)
#     mod.instance_eval {
#       instance_methods(false).each { |m|
#         if instance_method(m).parameters.empty? || instance_method(m).parameters.first.first == :opt
#               puts "--#{[self, m, mod.instance_method(m).parameters]}"
#               # begin
#               #   puts send(m){}
#               # rescue LocalJumpError
#               #   puts "@@@@@@@@@@@@@ #{[self, m]} %%%%%%%%%%%%%"
#               # end
#             # end
#         end
#       }
#     }
#     # .map{[con,m,method(m).parameters]}
#   }
# end
# def prob str
# @prob ||=[]
# @prob << str
# end
# def pro
#   @prob
# end

  #   sample_instance_m = instance_methods(false).sample
  #   if sample_instance_m
  #     begin
  #       m = method(sample_instance_m)
  #     rescue TypeError, NameError
  #       fuzz
  #     end
  #   else
  #     fuzz
  #   end
  #   if m
  #     if m.parameters.empty? || m.parameters.first.first == :opt
  #       m.call {}
  #     else
  #       fuzz
  #     end
  #   else
  #     fuzz
  #   end
  # end
# 600000.times{puts fuzz}
# 1000.times{puts fuzz;sleep(0.3)}
# 60000.times{puts fuzz}
# puts @aa
# # binding.pry
# puts pro.sort.uniq.size
# puts pro.sort.uniq