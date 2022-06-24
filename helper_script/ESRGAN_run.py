import sys,os,re
def space_safe(str):
  if len(str) == len(str.replace(' ','')):
    return str
  else:
    return '"'+str+'"'
input_folder = os.path.split(sys.argv[0])[0]+'\\input'
output_folder = os.path.split(sys.argv[0])[0]+'\\output'
print('创建输入/输出文件夹')
if not os.path.exists(input_folder):
  os.popen('mkdir '+input_folder)
if not os.path.exists(output_folder):
  os.popen('mkdir '+output_folder)
with open(os.path.split(sys.argv[0])[0] + '\\run.config') as lines:
  for line in lines:
    exec(line)

if skip_existing_output_files:
  skip_existing_output_files = ' --skip-existing'
else:
  skip_existing_output_files = ''

if delete_input_files_after_process:
  delete_input_files_after_process = ' --delete-input'
else:
  delete_input_files_after_process = ''
seamless = 'tile'

if use_CPU_instead_of_CUDA:
  use_CPU_instead_of_CUDA = ' --cpu'
else:
  use_CPU_instead_of_CUDA = ''

if floating_point_16:
  floating_point_16 = ' --floating-point-16'
else:
  floating_point_16 = ''

if cache_max_split_depth:
  cache_max_split_depth = ' --cache-max-split-depth'
else:
  cache_max_split_depth = ''

if binary_alpha:
  binary_alpha = ' --binary-alpha'
else:
  binary_alpha = ''

if ternary_alpha:
  ternary_alpha = ' --ternary-alpha'
else:
  ternary_alpha = ''

if verbose:
  verbose = ' --verbose'
else:
  verbose = ''

model_dir = os.path.split(sys.argv[0])[0]+'\\models'
models = os.listdir(model_dir)
customize_model_usage = ""
os.system('cls')
if customize_model_usage.strip()=='':
  if len(models) == 0:
    print('models文件夹中没有模型，请放几个进去')
    input()
    exit()
  for i in range(len(models)):
    model = models[i]
    print('\n\n[%d] %s' % (i+1, model))
    with open('%s\%s\desc' % (model_dir,model)) as lines:
      for line in lines:
        print('    '+line, end='')
  selected_model = int(input('\n\n请选择一个模型：'))
  os.system('cls')
  variants = os.listdir('%s\%s' % (model_dir,models[selected_model-1]))
  variants.remove('desc')
  if len(variants) == 1:
    model_pth = '%s\%s\%s' % (model_dir,models[selected_model-1],variants[0])
  else:
    for j in range(len(variants)):
      variant = variants[j]
      print('[%d] %s' % (j+1, variant))
    selected_variant = int(input('请选择此模型的特定种类：'))
    os.system('cls')
    model_pth = '%s\%s\%s' % (model_dir,models[selected_model-1],variants[selected_variant-1])
  print('use model: '+model_pth)
else:
  model_pth = customize_model_usage
print('开始运行ESRGAN')
upscale_exec = os.path.split(sys.argv[0])[0]+'\\ESRGAN-master\\upscale.py'
tmp_bat = os.path.split(sys.argv[0])[0]+'\\tmp.bat'
cmd_str = 'python %s --input %s --output %s%s%s --seamless %s%s%s%s%s%s --alpha-threshold %s --alpha-boundary-offset %s --alpha-mode %s%s %s' % (upscale_exec, input_folder, output_folder, skip_existing_output_files, delete_input_files_after_process, seamless, use_CPU_instead_of_CUDA, floating_point_16, cache_max_split_depth, binary_alpha, ternary_alpha, alpha_threshold, alpha_boundary_offset, alpha_mode, verbose, model_pth)
with open(tmp_bat,'w+') as cmd_file:
  cmd_file.write('@echo off && call conda activate ESRGAN 1>NUL 2>NUL && ' + cmd_str)
os.system('%s && del %s' % (tmp_bat,tmp_bat))
#cmd = f"python upscale.py --input '{input_folder}' --output '{output_folder}'{skip_existing_output_files}{delete_input_files_after_process} --seamless {seamless}{use_CPU_instead_of_CUDA}{floating_point_16}{cache_max_split_depth}{binary_alpha}{ternary_alpha} --alpha-threshold {alpha_threshold} --alpha-boundary-offset {alpha_boundary_offset} --alpha-mode {alpha_mode}{verbose} '{model_pth}'"
input()
