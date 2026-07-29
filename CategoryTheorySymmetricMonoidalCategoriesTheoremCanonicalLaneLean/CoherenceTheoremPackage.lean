import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean.SymmetricMonoidalCategoryPackage

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean

structure CoherenceTheoremPackage {C : CategoryPackage} {M : MonoidalCategoryPackage C}
    (S : SymmetricMonoidalCategoryPackage M) where
  coherenceStatement : Prop
  allDiagramsCommute : coherenceStatement

structure CoherenceTheoremEvidence {C : CategoryPackage} {M : MonoidalCategoryPackage C}
    {S : SymmetricMonoidalCategoryPackage M} (P : CoherenceTheoremPackage S) where
  coherenceStatementClosed : P.coherenceStatement

def CoherenceTheoremClosed {C : CategoryPackage} {M : MonoidalCategoryPackage C}
    {S : SymmetricMonoidalCategoryPackage M} (P : CoherenceTheoremPackage S) : Prop :=
  P.coherenceStatement

theorem coherence_theorem_closed_from_evidence {C : CategoryPackage} {M : MonoidalCategoryPackage C}
    {S : SymmetricMonoidalCategoryPackage M} (P : CoherenceTheoremPackage S)
    (E : CoherenceTheoremEvidence P) : CoherenceTheoremClosed P := by
  exact E.coherenceStatementClosed

end CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean
end HautevilleHouse