CREATE TABLE informacion_academica ( 
    id_infoacademica INT AUTO_INCREMENT PRIMARY KEY, 
    profesion VARCHAR(150) NOT NULL,
    id_niveleducativo INT NOT NULL,
    posgrado VARCHAR(150) NULL,
    id_funcionario INT NOT NULL,
    CONSTRAINT fk_niveleducativo FOREIGN KEY (id_niveleducativo) 
        REFERENCES nivel_educativo(id_niveleducativo)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_funcionario FOREIGN KEY (id_funcionario) 
        REFERENCES funcionarios(id_funcionario)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);