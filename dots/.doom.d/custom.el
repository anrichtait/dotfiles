;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   '((eval setq-local company-clang-arguments
      '("-I./include" "-I./lib/imgui" "-I./lib/rlImGui" "-I/usr/include/raylib"))
     (lsp-clients-clangd-args "--header-insertion=never"
      "--compile-commands-dir=./build" "--query-driver=/usr/bin/g++")
     (projectile-project-run-cmd . "cd build && ./RaylibEngine")
     (projectile-project-compilation-cmd . "cd build && cmake .. && make")
     (company-clang-arguments
      "-I/home/anrichtait/Documents/engines/butano/butano/include/"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
