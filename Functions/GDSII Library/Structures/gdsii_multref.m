function [astruc] = gdsii_multref(name, struc, xy, strans)
%function [astruc] = gdsii_multref(name, struct, xy, strans)
%
% gdsii_multref :  replicates a structure at many positions. The
%                  positions are not restricted to a grid. It is
%                  much easier to use than an array reference.
%
% name  :  name of the new structure.
% struc :  gds_structure object to be replicated.
% xy :     a nx2 matrix of positions (one per row) at which the 
%          input structure is replicated.
% strans : (Optional) an strans structure to modify orientation and
%          scaling of 'struc'.
% astruc : a gds_structure object containing references to the
%          input structure.

% Initial version: Ulf Griesmann, NIST, November 2013

% check arguments
if nargin < 4, strans = []; end
if nargin < 3, error('gdsii_array:  too few arguments.'); end;
if ~ischar(name)
    error('gdsii_array: first argument must be a string.');
end
if ~isa(struc, 'gds_structure')
    error('gdsii_array: second argument must be a gds_structure object.');
end

% create the output structure
astruc = gds_structure(name);

% add compound reference element to output structure
if isempty(strans)
    astruc = add_ref(astruc, struc, 'xy',xy);
else
    astruc = add_ref(astruc, struc, 'xy',xy, 'strans',strans);
end    

return
