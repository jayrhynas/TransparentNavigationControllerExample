//
//  ModelItem.swift
//  TransparentNavigationControllerExample
//
//  Created by Jayson Rhynas on 2020-06-26.
//  Copyright © 2020 Jayson Rhynas. All rights reserved.
//

import UIKit

struct ModelItem {
    let title: String
    let description: String
    
    let color: UIColor
    
    static let allItems: [ModelItem] = (1...10).map {
        ModelItem(
            title: "Item \($0)",
            description: lipsum.randomElement()!,
            color: UIColor(hue: CGFloat.random(in: 0..<360), saturation: 0.8, brightness: 0.8, alpha: 1.0)
        )
    }
}

private let lipsum = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Atqui eorum nihil est eius generis, ut sit in fine atque extrerno bonorum. Color egregius, integra valitudo, summa gratia, vita denique conferta voluptatum omnium varietate. Haec et tu ita posuisti, et verba vestra sunt. Quid ei reliquisti, nisi te, quoquo modo loqueretur, intellegere, quid diceret? Duo Reges: constructio interrete. Istam voluptatem perpetuam quis potest praestare sapienti? Stulti autem malorum memoria torquentur, sapientes bona praeterita grata recordatione renovata delectant. Est tamen ea secundum naturam multoque nos ad se expetendam magis hortatur quam superiora omnia. Memini vero, inquam;
Num igitur eum postea censes anxio animo aut sollicito fuisse? Quid, si reviviscant Platonis illi et deinceps qui eorum auditores fuerunt, et tecum ita loquantur? Quod autem principium officii quaerunt, melius quam Pyrrho; Sed haec in pueris; Non quam nostram quidem, inquit Pomponius iocans; Istam voluptatem, inquit, Epicurus ignorat? Primum cur ista res digna odio est, nisi quod est turpis?
Hoc positum in Phaedro a Platone probavit Epicurus sensitque in omni disputatione id fieri oportere. Teneo, inquit, finem illi videri nihil dolere. Te ipsum, dignissimum maioribus tuis, voluptasne induxit, ut adolescentulus eriperes P. Multoque hoc melius nos veriusque quam Stoici. Et hunc idem dico, inquieta sed ad virtutes et ad vitia nihil interesse. Eaedem enim utilitates poterunt eas labefactare atque pervertere. Tria genera cupiditatum, naturales et necessariae, naturales et non necessariae, nec naturales nec necessariae.
Zenonis est, inquam, hoc Stoici. Compensabatur, inquit, cum summis doloribus laetitia.
Isto modo ne improbos quidem, si essent boni viri. An ea, quae per vinitorem antea consequebatur, per se ipsa curabit? Quis hoc dicit? Tollenda est atque extrahenda radicitus. Vulgo enim dicitur: Iucundi acti labores, nec male Euripidesconcludam, si potero, Latine;
Ex ea difficultate illae fallaciloquae, ut ait Accius, malitiae natae sunt. Itaque in rebus minime obscuris non multus est apud eos disserendi labor. Non laboro, inquit, de nomine. Ita enim vivunt quidam, ut eorum vita refellatur oratio.
Dicimus aliquem hilare vivere; Itaque primos congressus copulationesque et consuetudinum instituendarum voluntates fieri propter voluptatem; Hanc ergo intuens debet institutum illud quasi signum absolvere. Bonum valitudo: miser morbus. Nam aliquando posse recte fieri dicunt nulla expectata nec quaesita voluptate. Respondent extrema primis, media utrisque, omnia omnibus. Ita ne hoc quidem modo paria peccata sunt.
Sed plane dicit quod intellegit. Quis animo aequo videt eum, quem inpure ac flagitiose putet vivere? Quis non odit sordidos, vanos, leves, futtiles? Nobis aliter videtur, recte secusne, postea; Si id dicis, vicimus. Tollitur beneficium, tollitur gratia, quae sunt vincla concordiae. Quem si tenueris, non modo meum Ciceronem, sed etiam me ipsum abducas licebit. Vitae autem degendae ratio maxime quidem illis placuit quieta.
Itaque vides, quo modo loquantur, nova verba fingunt, deserunt usitata. Quamquam tu hanc copiosiorem etiam soles dicere. Quid, si reviviscant Platonis illi et deinceps qui eorum auditores fuerunt, et tecum ita loquantur? Sed id ne cogitari quidem potest quale sit, ut non repugnet ipsum sibi. Certe, nisi voluptatem tanti aestimaretis.
Quae qui non vident, nihil umquam magnum ac cognitione dignum amaverunt. Piso, familiaris noster, et alia multa et hoc loco Stoicos irridebat: Quid enim? Sed videbimus. Idemne, quod iucunde? Illum mallem levares, quo optimum atque humanissimum virum, Cn. Nobis aliter videtur, recte secusne, postea; Hunc vos beatum;
""".split(separator: "\n").map(String.init)
