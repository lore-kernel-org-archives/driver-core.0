Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5A03DBD79
	for <driver-core@lists.linux.dev>; Fri,  8 May 2026 12:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778243961; cv=none; b=uc9vwYQZHD3cwvDreOL2KsIgAnnE82QAsHoETbG7j3gFI4zdiIXgjoYOyWjqOjwQ4+gtkpak+tZVitl041MTzxEaIgjVbUtoMdriHrf1evhjJJYcZN2bRkE8LHAezkJjvjcRabKgg4B2EOW0ovDiVrlXNhjSb1NHfvDa9qoUo+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778243961; c=relaxed/simple;
	bh=p8gi3qjlLhtg1BCpOonW7EQL8OEq2teWXfzB6HK1X/I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e88CvWRpaXA98w04qQ5YGRivjDZ4fZTL62yDpeqXwW6RZ19+0IRgdT56i825H/cLDXXjnK4XhgZ+uPPXCu4eaEmhVsvYdGII/RNi/wntXYAD6mVYzDOTLxHk11Ud8e6ghmJAsm3pcQMnGiWPHPuL8P4cQ57+bn+2QHTyyvnDzHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cz+y9LRL; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cz+y9LRL"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38be5e86918so24419501fa.3
        for <driver-core@lists.linux.dev>; Fri, 08 May 2026 05:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778243958; x=1778848758; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cDX108p0uzre2YaOaDlgaGo1Iqc97n6Wg0g1XdnjXXg=;
        b=cz+y9LRLdzLokEjeN7Pp3pflFc0NTwYuWk2rGpATph3oN/EVNhz3NgcG7QbDFGgyKo
         rH0SPCjfj6INSAax2FPwkIkutSgjuel7g99clART07TrSBR+88f2OjUtLN5DLFI7svk0
         vYEHAe6ds37xHhNMzkE1Ty3sBsEa5/3T94EdGV4D1kzBw8QUYqtDEg97nu6mDIoY7ZbK
         TonXmkRSKpvUQ/v4TXHYqf8nn9c/tizR/Jv9vUvXZkA79bZHbX+UcbiqIOUp+kPX2myA
         WeD+FDNed7o8aSVTSsvfzFzGTPtXk8Xu1drKnUSpyZnyWnXdgQ6rmr7Rrp3jEgLc3pJ5
         pSjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778243958; x=1778848758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDX108p0uzre2YaOaDlgaGo1Iqc97n6Wg0g1XdnjXXg=;
        b=fJuQ54BQqNwZig2mnQHMeMiCkq75ZSZ6NTIKc+aCQo997MokIOLYQER2v9rwLkigUc
         YBOHxyc//jwwCHTLhFa5nw9C0DVPK6mvTRvmt/QP64KbCR3FFS93QW2nrWpCZQK1XhYK
         wmbMIgTLtLDMU02NshLb2PAxbnRcfz30/MzN+cl5hYJZY6FuCaBFfR/cdun/zoEXvhbk
         hJld9MqvlVEGl0AUDEGbjfWX0g27RlfVWm5hcpbbFEAwigb4VZENnAMSuhFeVP5Oe9Jl
         syow49Sg92S2wHv7F1qSREfAdRhBiRgWn0sHVX4v5q7qVtnK04v/BxdcMF05RtgGYEne
         7pBQ==
X-Forwarded-Encrypted: i=1; AFNElJ/5IDBq0UQg3d5WZtk/ZsDdKsZdX1XJxeJhVxy0m4K39arozFKFmd9CsuLtXIN5wKcsWpFNfREkPa/ZOw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzd5YoBhkgZYOSIjXRNPRzy9v0cm8JWfGSpRNl17Lp0v+s3txjl
	l1PWG8KW0NvKStK3Df/vLU0+3V/D2E8WZIc1yyMUVnGR7idn5483SOYGKcntclyiT3Y=
X-Gm-Gg: Acq92OFxy6HHg5adTlqOQCsM+ZPkjV2X8jSg0fE1lhCT4g133Bq4tOnUkdD7lE2W8ys
	qStCoqQnb7DUbGI40YUpVBb9UVnJJtDoq9Sh98kvVTwpzbUadxTbm/1jhRjJnyGP7G2j4tNRvJk
	X+YmIk0TWuKhWEZuxM/6Jt6Fer7ZwLlmri+07grwNloxFlxMTuAu5rAQ5P8oCDc12h34AExOYv2
	sjkbChCVBEn1hryGSHdKSKcm5BD/EEEPVm/oNNjFKmqD9CsQqM7SsVIp5DFlsNCySUcWeuC/mlR
	jacSZ/h+IgQ1seew0lZBVuhd4aevbUPBJCIUpokbpCa+fFfhvcXMS3m98dpWwJ2OSS0l2yoAhsI
	DTsP1HcbYxDHIlPz8dTpBacdI0VBGHpE+E/rg5anz6e2Pk3rXPVvHXBYmgLAsxzwKXyXESsWaYx
	syeDt7qe9K26mCKau6Ln5imLb1SL/OYnWnTXc0IT3jLwexY8lzIvvvcnoBKfipRaL05o7yER9l
X-Received: by 2002:a2e:9f08:0:b0:393:7ab3:6d50 with SMTP id 38308e7fff4ca-393c40bcc4dmr37791951fa.6.1778243957558;
        Fri, 08 May 2026 05:39:17 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5fcc7sm4569621fa.18.2026.05.08.05.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 05:39:17 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Danilo Krummrich <dakr@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 00/13] driver core / pmdomain: Add support for fined grained sync_state
Date: Fri,  8 May 2026 14:38:49 +0200
Message-ID: <20260508123910.114273-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v3:
	- Dropped tested-by tags from Geert, due to changes in patch2.
	- Addressed the comments from Danilo and Geert, more information in the
	changelog for each patch.

Assuming this is accepted, the best merge strategy would be for Danilo to pick
up the driver core patches (1 to 4) and host a branch that I can pull into my
pmdomain tree so I can take the rest of the series. Danilo, please let me know
what you prefer.

Since the introduction [1] of the common sync_state support for pmdomains
(genpd), we have encountered a lot of various interesting problems. In most
cases the new behaviour of genpd triggered some weird platform specific bugs.

That said, in LPC in Tokyo me and Saravana hosted a session to walk through the
remaining limitations that we have found for genpd's sync state support. In
particular, we discussed the problems we have for the so-called onecell power
domain providers, where a single provider typically provides multiple
independent power domains, all with their own set of consumers.

Note that, onecell power domain providers are very common. It's being used by
many SoCs/platforms/technologies. To name a few:
SCMI, Qualcomm, NXP, Mediatek, Renesas, TI, etc.

Anyway, in these cases, the generic sync_state mechanism with fw_devlink isn't
fine grained enough, as we end up waiting for all consumers for all power
domains before the ->sync_callback gets called for the supplier/provider. In
other words, we may end up keeping unused power domains powered-on, for no good
reasons.

The series intends to fix this problem. Please have a look at the commit
messages for more details and help review/test!

Kind regards
Ulf Hansson

[1]
https://lore.kernel.org/all/20250701114733.636510-1-ulf.hansson@linaro.org/


Ulf Hansson (13):
  Revert "driver core: move dev_has_sync_state() to drivers/base/base.h"
  driver core: Enable suppliers to implement fine grained sync_state
    support
  driver core: Add documentation for dev_set_drv_sync_state()
  driver core: Add dev_set_drv_queue_sync_state()
  pmdomain: core: Move genpd_get_from_provider()
  pmdomain: core: Add initial fine grained sync_state support
  pmdomain: core: Extend fine grained sync_state to more onecell
    providers
  pmdomain: core: Export a common function for ->queue_sync_state()
  pmdomain: renesas: rcar-gen4-sysc: Drop GENPD_FLAG_NO_STAY_ON
  pmdomain: renesas: rcar-sysc: Drop GENPD_FLAG_NO_STAY_ON
  pmdomain: renesas: rmobile-sysc: Drop GENPD_FLAG_NO_STAY_ON
  pmdomain: core: Avoid an unnecessary power off at sync_state
  pmdomain: core: Add a couple of debug prints for sync_state

 drivers/base/base.h                       |  22 ++-
 drivers/base/core.c                       |  77 ++++++--
 drivers/base/driver.c                     |   7 +
 drivers/pmdomain/core.c                   | 227 ++++++++++++++++++----
 drivers/pmdomain/renesas/rcar-gen4-sysc.c |   1 -
 drivers/pmdomain/renesas/rcar-sysc.c      |   1 -
 drivers/pmdomain/renesas/rmobile-sysc.c   |   3 +-
 include/linux/device.h                    |  44 +++++
 include/linux/device/driver.h             |   7 +
 include/linux/pm_domain.h                 |   3 +
 10 files changed, 318 insertions(+), 74 deletions(-)

-- 
2.43.0

