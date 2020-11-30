manifest= "~/Downloads/TCGA-CHOL/gdc_manifest.2018-02-13T11_53_40.364842.txt" #Manifest name 
x=read.table(manifest,header = T,sep='\t',stringsAsFactors = F)
id= toString(sprintf('"%s"', x$id))
Part1= '{"filters":{"op":"in","content":{"field":"files.file_id","value":[ '
Part2= '] }},"format":"TSV","fields":"file_id,file_name,cases.submitter_id,cases.case_id,data_category,data_type,cases.samples.tumor_descriptor,cases.samples.tissue_type,cases.samples.sample_type,cases.samples.submitter_id,cases.samples.sample_id,cases.samples.portions.analytes.aliquots.aliquot_id,cases.samples.portions.analytes.aliquots.submitter_id","size":"10000"} '
Sentence= paste(Part1,id,Part2, collapse=" ")
write.table(Sentence,"Payload.txt",quote=F,col.names=F,row.names=F)
