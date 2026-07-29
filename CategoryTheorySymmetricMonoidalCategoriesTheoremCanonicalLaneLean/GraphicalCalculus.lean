import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean.SymmetricMonoidalCategory

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean

structure GraphicalCalculusPackage {C : SymmetricMonoidalCategory} where
  stringsRepresentation : Prop
  topologicalInvariance : Prop
  isotopyEquivalence : Prop
  graphicalProofSoundness : Prop

structure GraphicalCalculusEvidence {C : SymmetricMonoidalCategory}
    (G : GraphicalCalculusPackage) where
  stringsRepresentationClosed : G.stringsRepresentation
  topologicalInvarianceClosed : G.topologicalInvariance
  isotopyEquivalenceClosed : G.isotopyEquivalence
  graphicalProofSoundnessClosed : G.graphicalProofSoundness

def GraphicalCalculusClosed {C : SymmetricMonoidalCategory}
    (G : GraphicalCalculusPackage) : Prop :=
  G.stringsRepresentation ∧ G.topologicalInvariance ∧
  G.isotopyEquivalence ∧ G.graphicalProofSoundness

theorem graphical_calculus_closed_from_evidence {C : SymmetricMonoidalCategory}
    (G : GraphicalCalculusPackage) (E : GraphicalCalculusEvidence G) :
    GraphicalCalculusClosed G := by
  exact And.intro E.stringsRepresentationClosed
    (And.intro E.topologicalInvarianceClosed
      (And.intro E.isotopyEquivalenceClosed E.graphicalProofSoundnessClosed))

end CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean
end HautevilleHouse