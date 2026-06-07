Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12BE1D5CFB
	for <driver-core@lists.linux.dev>; Sun,  7 Jun 2026 03:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780804295; cv=none; b=aCGmquexKOoS+5iga4C7DDLBuM/cGCxEEX6co+tbWslpHB/6OnEdcPKD8GuZ1CxraxH7opHOmgdBDq7ntqf4seN3iv3Ib1bwjyyAGzClrZ/pUrmhPQ+EjX21avFXVWM8PtwBB4xZIkpWQvva1o824KCPt/pzMKmo8fPyRH8zFb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780804295; c=relaxed/simple;
	bh=bZLe+6LzzFIVuKXA64lcJ3QreAqIAsCs5havUEqiero=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UgKLWNWV0XIDvMpAUqxHXFiVkDv1na4eGPGuNe9mGWHTBDapsK5uCp37OXUDlsLwhv1W30esvH7etBSy4XAC1mExKxZIswwWDQvYew5fDGq13xrQr07LIiZ+ESADdL6XpsznMVIOqFH7Pt34/dAByqMqVduoi8IyJdKc0o5YbTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aig1WJCx; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aig1WJCx"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-307631dbfedso7245968eec.0
        for <driver-core@lists.linux.dev>; Sat, 06 Jun 2026 20:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780804293; x=1781409093; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8IYt6F2f6eV7Auqh5TfQyg7EFSRsU97hdklgbVAkw34=;
        b=Aig1WJCxgiO5X2UsaJC2/jPAcTnUp3MPqMiEK7i5GErlVwIICs8/lcy4mra3F2XeYE
         6A0ruRugqO8GMELUJZYZCuU0JtP2Vv7sbOc7ZK4K6njEIPk4jwfqmlWbPX5vn6LhOkcV
         K42w+edBq+vYfj/Cm3mRQC3yrG9Tv7siSJpNXC4//t8iqYMrBx0LJB22Dw7W1dnikclZ
         5nFSDFJuj4+aGjywVzZxbPLFiimIFLjsm6sB2LjQopC3nVvS1hY01wmtYPpAwBmmy/BZ
         u0pQxC0mtEHsl/54woDFAtdgd9Vyy/0G1sePc8Q8oG5ibx5f24bIkQFibpKf38jmvjcu
         IYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780804293; x=1781409093;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8IYt6F2f6eV7Auqh5TfQyg7EFSRsU97hdklgbVAkw34=;
        b=aZSoEullWHwDtg4tNzd0JVaITZ5VmEFndwHXxMbN9XqVmBtNTdyu5p1bvGsyRg5hny
         jgutWAfIqOu0zsFsaZzhRUKlTDIsW7xT2VCJCINwFlISuHFDqGDaDCVtxiJlsWSYE2Aa
         OObcL6BMTaQai09PEcWATPiPe+XMtE5pn0BoYZHfjcZt8ky0OkW82AR/9sFKQLzICcvX
         0A4DBGOL+nd830xliOJAQ1jIz2jK6TCUXSpZBqScXnt8Of3sgtC4Muh31wSM4CNwVabX
         IWz34nIHNn4ftl0oAqcLUV9zWdcnRh1LxCPSVpwKQVb985nivOD0at7Tc4fNY0t/b3cz
         P53Q==
X-Forwarded-Encrypted: i=1; AFNElJ8M57iLqkUtYFMSNH9UvwsH2wAi7uaj71XTjdy6scuHLKabrM3S98adNUySveaL8aS/slTSBdxqP3p26Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzbGYnmUugc2VyxmIVflgct+E10MtyLFkzkmMazPqB9nsPKm6zQ
	5OkdJ/c2K2QYjqBmOQHRW7l0aZqd9bfXBhBhcFTRuhB3HJkr6YRq5QtB
X-Gm-Gg: Acq92OFgnSnhDBjmBJ6HPWU26TZt4y2ikR8XEofru9SAl+7PdBtmufNxJDJ5VUsngKo
	l0qxlEZkR0HGSumN1J3yWg6y242fr8wSa8TeYQMb/PJv3P5PayxjWGzToKasS04YUfZou+Aljgl
	zHp+pzIj/J8rQJHL+5VvD0NXcq2HputhfwYJx/WsTiR9Ews0VIjOhh6xDi1Xzn1dskGn3L6wKeY
	/uwafjMkM38DBeB8D0Eld8vA08J7IWQuA62kGT+Qx/KOVHoBVh8/+8MvY7Lw1Ke9A/ZeMb9fxjv
	jnEmFzy3GgXzvHWMlUobWKt4b36zzqFeMh9RAJpUkVT+uzyTidm8NrUN5/xTsGo3xcGAYkZXTl0
	dq5UAtLreohUFpQpnBgKda22gmU6EGmBQliaUtcrgugtDOKk53PMS6kcT6VmpJeOEabMShGyW37
	PW/yshz5yTuGwgpsnnDTJU1YG+HOmShw6JeZl9JlSx8WD7s4aSAub0e2uYoROar7sK9jNbboA6A
	3KQX+FYm8GQhg==
X-Received: by 2002:a05:7300:320c:b0:2ed:6f94:9d9f with SMTP id 5a478bee46e88-3077b2e0c15mr5908783eec.11.1780804292844;
        Sat, 06 Jun 2026 20:51:32 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:bb2f:1c0b:386d:8909])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db528dcsm15228525eec.3.2026.06.06.20.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 20:51:32 -0700 (PDT)
Date: Sat, 6 Jun 2026 20:51:29 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] software node: allow passing reference args to
 PROPERTY_ENTRY_REF()
Message-ID: <aiTo4dvKu8pyimHA@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

When dynamically creating software nodes and properties for subsequent
use with software_node_register() current implementation of
PROPERTY_ENTRY_REF() is not suitable because it creates a temporary
instance of struct software_node_ref_args on stack which will later
disappear, and software_node_register() only does shallow copy of
properties.

Fix this by allowing to pass address of reference arguments structure
directly into PROPERTY_ENTRY_REF(), so that caller can manage lifetime
of the object properly.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

This is pulled from a larger series dealing with breakage on Geode:
https://patch.msgid.link/20260329-property-gpio-fix-v2-0-3cca5ba136d8@gmail.com

v3: addressed Andy's comments about formatting and commit description.

 include/linux/property.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/linux/property.h b/include/linux/property.h
index e30ef23a9af3..14c304db4664 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -471,12 +471,18 @@ struct property_entry {
 #define PROPERTY_ENTRY_STRING(_name_, _val_)				\
 	__PROPERTY_ENTRY_ELEMENT(_name_, str, STRING, _val_)
 
+#define __PROPERTY_ENTRY_REF_ARGS(_ref_, ...)				\
+	_Generic(_ref_,							\
+		 const struct software_node_ref_args *: _ref_,		\
+		 struct software_node_ref_args *: _ref_,		\
+		 default: &SOFTWARE_NODE_REFERENCE(_ref_, ##__VA_ARGS__))
+
 #define PROPERTY_ENTRY_REF(_name_, _ref_, ...)				\
 (struct property_entry) {						\
 	.name = _name_,							\
 	.length = sizeof(struct software_node_ref_args),		\
 	.type = DEV_PROP_REF,						\
-	{ .pointer = &SOFTWARE_NODE_REFERENCE(_ref_, ##__VA_ARGS__), },	\
+	{ .pointer = __PROPERTY_ENTRY_REF_ARGS(_ref_, ##__VA_ARGS__) },	\
 }
 
 #define PROPERTY_ENTRY_BOOL(_name_)		\
-- 
2.54.0.1032.g2f8565e1d1-goog


-- 
Dmitry
