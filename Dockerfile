# 1. Imagem base com Go para compilar o código
FROM golang:1.24-alpine

# 2. Criar diretório de trabalho
WORKDIR /app

# 3. Copiar arquivos de dependências
COPY go.mod ./
RUN go mod tidy

# 4. Copiar o restante do código
COPY . .

# 5. Compilar o binário (GOOS e GOARCH garantem compatibilidade)
RUN go build -o main .

# Comando de execução
CMD ["./main"]