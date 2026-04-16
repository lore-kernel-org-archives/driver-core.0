Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB84537F8DB
	for <driver-core@lists.linux.dev>; Thu, 16 Apr 2026 23:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776383797; cv=none; b=LWSi6Nl14OnDIvFiUX5b9p+Hbul2fFnq/Yi9cp0g5XRO2p7KVeV4oGgOy9wVBk7Kfocemi1YAkOaf6SkRHP06zCm62pREMeVToSC10Fnk6oDYEBhingJ9uzQOqN5TXU+jk7zRlLfAnlfF84i28mU7phkn3Fay9o3v6NfJRynyUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776383797; c=relaxed/simple;
	bh=ck2VJ/zWj05Aj+s8teEzGH5V1VeifG8sD7WLckVzR7g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jy2xqB5AjkgKRmddgHDQ7tZ8uZE9WbAjqBqozY/t4AzsMAaXvefOKjQ6g8UwL11AVBJixp2pl+G7hh8Ssmm6VDRV4wr7rg7CalDcjccEy6gDA8QezhtJEVNNi7EhIyl5MZifl4HqiNP6rh/lRMngOTcEh6PZnGwGK2worDEAktg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fw/bwgGK; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fw/bwgGK"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8d4f78fc9f6so11715285a.3
        for <driver-core@lists.linux.dev>; Thu, 16 Apr 2026 16:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776383796; x=1776988596; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=muSutUnQ3k1ov/G6xk5xkScEVtLMLhqZsYl6TyAiBqw=;
        b=Fw/bwgGK0oSkznAcrKa5H8v3Wo+WfOVnM701xC5Jq78Grl0yAA3++NpADe/ONjhh3Q
         nSZXrVRmyHy+dJWub7MDfveECFZ+BVnKbTwvsVuIy6vi2zbc3KSW2+vaohxy5+ya+eUM
         7n0TIxM+3dUFRMQrEtoE0uY4VzH0EnJfrGi8HV4UfHhhLEdpVFtEn28e8B0zhQBdkfFJ
         Glq4QaoL8COqCeEXgQ0bb52YSS70l2bhDE+eyswxZMbxZi/SU857hIqJQmpc+WM6bGNh
         sCVxnkmjatMW42EJKG28zECmOcu3blABnrOMbIiAdJprdt4NvgQBwY+HzdR1slIWlMQV
         5GBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776383796; x=1776988596;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=muSutUnQ3k1ov/G6xk5xkScEVtLMLhqZsYl6TyAiBqw=;
        b=mHJltY+G1TDcUzXY4RFMJGS0DHiw72u4bPFElftLlPtKQhzuLudQSLVxZKFprEzg92
         AivKfo8KpGfUpFvFmJ77C2866XmxIOc3aYQqYp8azKudh+QowJRc4/j4OWw4D15HvBPH
         Mn6j8FroNtwjqbQXx7iw509nr65kUHNMNcJU50eWX2TE3O45dJUQJ6Yj3tw/rYoch3Mc
         tDtclp0vOrS8Vt6odcklTa459IWfTNsj9GV1ns7nbG6SicRUn1Hfmgfd0956f21mEPsn
         tKN6fSYJri1Kt06POasnzi/GejwXgpGa4bDWWg3ql6cYCdFkf+koAId0Q6DZ/KWZQm3P
         v1Ng==
X-Forwarded-Encrypted: i=1; AFNElJ/K+c6WnZ0ZdFhj3y5SF1+gX7WWGc+jYSkRe25+3qTlYFuv3kBTIbF/2k5B0bbiFeO8D/A7mHFhGIsq5Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywj33vD9V8TrcSi0izqPHgJYNMIuIEqTk6t84e/z7fvF4vLI1Sq
	qirxiJIFXqVMlqJ4jc3Mz2FQSfwaQ/cq3ph2BlPFlgEmeJUY+wUQyRqK
X-Gm-Gg: AeBDieuGNLYfxDqADIVchwNCnmUmxbkN7pdfVangJjjH3jS04yo/mbcLXlVWREsKp07
	g1wND2blU3gBiCLOnATW71xDimlR4G2io11tCSeERr7+C7NctdbJaOmfcroSc/Lq98WqSVtDd7z
	NaSK27j7+eP54eQC6cp8aMRlvyjDeHCjC0P94lftq1SJHVptjA36M44Xti4pFIYdJWCE3bSFgiX
	OIY4ZLFefS6s/lyP+VRlxXhVwYBapzX4Wt/n9eIgIBbsfecET+UPro1IUy3RTbkN9h25048u5do
	+nGtDvXAlZ3hWGXQ/J2y86NfpSabZlQNJ0o7YQtCXfXd7YbT/MC5nGoDRqjw1tWW1adRewJkT/Z
	h5jCFFQYaJQpzxXf4w8ydxyymA5CiD10REB2yYBAKZUWugLA4AEoaohHhCN0s29ybW5OveU4556
	SWVW6QEkUBY7t6pe0fWe/4KCxALtLVyqc2/5IAeysCDRiHBKCgoLA7tvcUCY4=
X-Received: by 2002:a05:620a:469e:b0:8e7:8067:5bbb with SMTP id af79cd13be357-8e7917a9fdbmr72219685a.40.1776383795589;
        Thu, 16 Apr 2026 16:56:35 -0700 (PDT)
Received: from d5-mxc5484.ad.psu.edu ([165.85.209.69])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7b036d9afsm8756385a.18.2026.04.16.16.56.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Apr 2026 16:56:35 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] regmap: ram: fix memory leaks in __regmap_init_ram() on error
Date: Thu, 16 Apr 2026 19:56:30 -0400
Message-ID: <20260416235630.78408-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two allocations in __regmap_init_ram() are not cleaned up on failure.

If the kzalloc_objs() for data->written fails, data->read is returned
with no way for the caller to free it.

If __regmap_init() fails, neither data->read nor data->written is freed
because its error paths do not call bus->free_context() (which is
regmap_ram_free_context() here). Only regmap_exit() does, and that is
never reached on an init failure.

Free the allocated arrays before returning any error.

Fixes: f6352424e37e ("regmap: Add RAM backed register map")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/base/regmap/regmap-ram.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/base/regmap/regmap-ram.c b/drivers/base/regmap/regmap-ram.c
index 0272d53fead11..c7356b0d8c832 100644
--- a/drivers/base/regmap/regmap-ram.c
+++ b/drivers/base/regmap/regmap-ram.c
@@ -71,11 +71,17 @@ struct regmap *__regmap_init_ram(struct device *dev,
 		return ERR_PTR(-ENOMEM);
 
 	data->written = kzalloc_objs(bool, config->max_register + 1);
-	if (!data->written)
+	if (!data->written) {
+		kfree(data->read);
 		return ERR_PTR(-ENOMEM);
+	}
 
 	map = __regmap_init(dev, &regmap_ram, data, config,
 			    lock_key, lock_name);
+	if (IS_ERR(map)) {
+		kfree(data->read);
+		kfree(data->written);
+	}
 
 	return map;
 }
-- 
2.50.1 (Apple Git-155)

