# encoding: utf-8
#
# Copyright 2014 Red Hat, Inc.
#
# This software is licensed to you under the GNU General Public
# License as published by the Free Software Foundation; either version
# 2 of the License (GPLv2) or (at your option) any later version.
# There is NO WARRANTY for this software, express or implied,
# including the implied warranties of MERCHANTABILITY,
# NON-INFRINGEMENT, or FITNESS FOR A PARTICULAR PURPOSE. You should
# have received a copy of GPLv2 along with this software; if not, see
# http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.

module Katello
  module Validators
    class KatelloNameFormatValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        if value
          NoTrailingSpaceValidator.validate_trailing_space(record, attribute, value)
          KatelloNameFormatValidator.validate_length(record, attribute, value)
        else
          record.errors[attribute] << N_("cannot be blank")
        end
      end

      def self.validate_length(record, attribute, value, min_length = 1)
        if value
          record.errors[attribute] << _("must contain at least %s character") % min_length unless value.length >= min_length
        end
      end
    end
  end
end
