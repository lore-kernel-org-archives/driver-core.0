Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796B248164F;
	Wed, 22 Jul 2026 08:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784709827; cv=none; b=TAbpKFSn4TJIYDDD23kI6AgU5dD1aT9vLBVjjsLBdJaScz92EWzFSUS4ndj0dZiGqm2FShyGCxQ5mrOzxOaWI8Pk8QdgYcfG7cOVrPQFV3UHmN0SVndmGdDf+eCJtQiaSTiW/33xFvuJuLvDofbyyeSYXr9yzbSOQ6VYnwNuGRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784709827; c=relaxed/simple;
	bh=DA2LsH4Jd5MF1qG95I2J6cn2R2yPkQGy8WeIdsJjhic=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jHhl3z7gBkiJAVnJ0opgxsDqL0DsGJG/5x/B0Z5E3ZMaRdhV8akqud0SiHW4zXeSmsfB1+hikrAXwiOaky4vjc+aro9kK+N2A02iWaC8Sj34jItGdtiE5hHT00eIfsHwpVDMTqjgg0LntkSg9TIlmAwyNIbgN2lGl6pUrWDmSag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JtEBdkcU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JtEBdkcU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 422E2C19425;
	Wed, 22 Jul 2026 08:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1784709826; bh=DA2LsH4Jd5MF1qG95I2J6cn2R2yPkQGy8WeIdsJjhic=;
	h=From:Subject:Date:To:Cc:From;
	b=JtEBdkcU3HsWsjdt5+gPXKLXBPIy5/fq2bI654P0JE7qE5adJZCohXKGXXHqEjVtV
	 AGoOfvfauhogccd7fwTvb0oLHFrMpNUr0neu0wkiMKeSIhU0W4WN0zmrnBjsDmtqAQ
	 T8+67tI1ZCMaunfFf9J0GwAZBMQcHgNal+9aM0ZU=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAAB0C4451C;
	Wed, 22 Jul 2026 08:43:45 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Subject: [PATCH RFC 0/2] regmap: support firmware-described non-sequential
 register reads
Date: Wed, 22 Jul 2026 10:42:45 +0200
Message-Id: <20260722-regmap-single-read-v1-0-aaaf31591669@linux.dev>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIWCYGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyMj3aLU9NzEAt3izLz0nFQgLzFFN9Eo1dLUwNwgOcXMTAmosaAoNS2
 zAmxotFKAY4izB0g0yM1ZKRYiW1yalJWaXAIyV6m2FgB4lBpjhAAAAA==
X-Change-ID: 20260722-regmap-single-read-a2e95070cd66
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 driver-core@lists.linux.dev, Richard Leitner <richard.leitner@linux.dev>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784709824; l=2228;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=DA2LsH4Jd5MF1qG95I2J6cn2R2yPkQGy8WeIdsJjhic=;
 b=guJ+3eWoZ5JTS58AI7qGHphtRB9TwV90ZwgNwiEqKHH38a9Zaa7cQElFmFMbYS8H8fAu0E76l
 qXUs+brb7M9AGdsYKcvFsnZAVyTNYwTO9Va5+RXQoFcT0VUBMmVPMpQ
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

Hi all,

this series adds support for firmware/device-tree described constraints
on sequential register reads.

The motivating use case are camera modules from Vision Components.
These modules may integrate image sensors that normally support
incrementing multi-register reads, while the MCU (which sits basically
"between" the I2C host and the camera sensors) breaks them. In such
cases, single-register reads work, but sequential/bulk register reads do
not.

This limitation is therefore not a property of the sensor silicon
itself, but of the hardware module/integration in which the device is
used. As a result, it cannot be identified from the deivce driver and
handling it in each affected device driver does not scale well.

To address this, the series introduces a common firmware property
(no-sequential-read) describing hardware integrations where reading
multiple consecutive registers in a single operation is not reliable.
regmap then consumes that property and maps it to its existing
use_single_read configuration. This keeps the hardware constraint
described in firmware/device-tree while applying it in the layer that
already owns the register read transfer policy.

The initial discussion that motivated this approach can be found here:
https://lore.kernel.org/lkml/20260721151614.GN50424@killaraus.ideasonboard.com/

Feedback is especially welcome on the property naming, the placement of
the common binding schema, and if regmap is the best place to implment this.

Thanks,
Richard

Link: https://lore.kernel.org/lkml/20260721151614.GN50424@killaraus.ideasonboard.com/
Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
Richard Leitner (2):
      dt-bindings: regmap: add common schema for no-sequential-read
      regmap: implement no-sequential-read firmware property

 .../devicetree/bindings/regmap/common.yaml         | 26 ++++++++++++++++++++++
 drivers/base/regmap/regmap.c                       | 14 +++++++++++-
 2 files changed, 39 insertions(+), 1 deletion(-)
---
base-commit: 248951ddc14de84de3910f9b13f51491a8cd91df
change-id: 20260722-regmap-single-read-a2e95070cd66

Best regards,
--  
Richard Leitner <richard.leitner@linux.dev>


