Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794294721;
	b=fOoBOH0j7BU2gg4k4FxnhZcpu4YWCC6jjVM5g6FYsuwuFU/R5sKUHsDMRF65jK3V2MS1
	 bQMFLRP0FsGFciT+INmIHGHwGiMtYDf384ELCpZHViKr65eCazhbVHGReaeGo4Y3OVC1s
	 w6KKGZ1Cazj3Pm1M2fcUyGVH4PDOddwWOH3wduE1Dr1jrhwP388Emx84viDhXM8oOgEAW
	 bdcQE1eBzFvrHY5SUqTd986WBlN27YFLRpfNQ5IqAKurlEKiEmszPYlgtvK3ZgHBbhnQg
	 5zQ5oThg9Bsv70DF+SOSzXFBYuiq+VsSwnIh7hjHL5kehMqM2mQSx3+YiHXJRE3qTtA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794294721;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=H7fK2Woj0IQZx7iLg3FEGBdfVw3+fs6khAnVlrNRDdo=;
	b=dfMXtCYQW8trz1xe42a8mFX7ZDq5aM1Jhcwh/qsw33Hoj57REQ3FG0vctVGs4/zPDibu
	 kUecX7nAaSBZlQVuFvkkDcSV4sqGq84FN4WOnw+rug4GNHK0JPyUYrj7mt4I95IJDwFw1
	 sRvvvK/aO5WmE7DyKLB0U0fHjSvXWMLd0DVZO/1wt0SM9QDL7Ls1N4nEB1mqAsNLrDUb7
	 mrSbl+vzuu45o0Y/V+gI4dv5l/jze/Zy6sK20tc2Wa1EfalGDm8yBhR+QjJVo2Iw7g2VG
	 rdahqzZXeqUtmEOfGSIxScRP5yxi1iGLM0p8mHqwm0I8ZFgzz/k1I52GZuT4gelyBTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YJIdZx0i;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D41C60A3802;
	Tue, 10 Nov 2026 07:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YJIdZx0i
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794294721;
	b=raj4a4ooXizr44OhoqD2Z/goUFVAICmeZqpo12fj+fCX+M4hzMxdJayu2PA0EETZ3M7V
	 ojTbmNu6RrOwRyX/9HRYarQwBhs0bMieLBWiwwnjEmdkm08WcOUQXBhO0tUUpUQFSRBwZ
	 kzSzVoTSmeA9NGlSH5gxUJCA+CVdtjgCXGdF8zmOU2g1SN67q78vl1Z52k5fy4Ppdcj60
	 hmYtRPkPocuRRICvl+LFBGPxvsaPX7boyTDteS9jvqjPkJ4aABnsz4b7LzxxY9ktqah4L
	 B0c9FHybWfpROUICWMVIy0ZOinjCX7lo1rvAhT9EfoHyRXKokDVF5URP4cSMP0dUVIg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794294721;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=H7fK2Woj0IQZx7iLg3FEGBdfVw3+fs6khAnVlrNRDdo=;
	b=jIKtVi7QBdGfM+IjESPXQE1qS5WBgAsFUWpysSyBLb8bRCm6wPzV+rf3lS+nYRI91ByW
	 VokdBouHsTbY2RtZ5JPPmmXgpOScGzYUAttarwligTvaw10sFl9/p0WZuDwjSYUcBriHW
	 iG2X80qzPLceP3hEzJ6waEK2a5QvJQAJVYteMHKK5x3IavKr/HKoZUN2FRNJdq9dYgde/
	 LCrofF3Ym3DgRXPaz4Qp5Ss7RqQqGZbsi8qXN4M2agzGUbpLX+6UwoTourglmh7f3JaVp
	 JisSE12CyjVgMDzWSFXFq2N6WqErFTE6K2x603OBCCCwMgTyghD1JpMf7GSnuJNiydw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 76F571F008A1;
	Tue, 10 Nov 2026 07:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794294721;
	bh=H7fK2Woj0IQZx7iLg3FEGBdfVw3+fs6khAnVlrNRDdo=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=YJIdZx0iPKh41hYHUYE4gRcq5h1FndL/qw1a5L6bi/cvW0Wsuzk1PW3PIQ4urY6KH
	 PEn/9v8V/vs2sP7B76BJIemm6S8oTnge/QtZ3slRTqyYOwvz4emapYFWkKN9fSdKNl
	 T6aUmsF2/ws9pTBOn9vSRhPj0Tut2tSBi714oXwTa0k2C8VhG4K7blJj3IYW2y17IX
	 /CPmvWDrO1fm2bvGdOpzADtNfZveniESPXahAI0gmqfq2wRko5BbyPyLHIcb/FP6MW
	 Zt6DEXRwovcFjc92fqwkdGpceYCyIaNnpfwqyCA/2EcCepuRmykljGjIByI33/gepe
	 EgQGh92Fyko9Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0C0FB488E6;
	Tue, 10 Nov 2026 07:11:59 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:11:59 +0000
Subject: [PATCH] driver core: fw_devlink: Don't report refused
 sync_state-only links as errors
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-fw-devlink-sync-state-v1-1-6385be961c2b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ6CMAyA4VchPduEcgDxVYyHdXRSNNOsEzWEd
 2fK8Tv8/wImScXgVC2QZFbTRyygQwV+dPEqqEMxNHXTElGN4Y2DzHeNN7Rv9GjZZcHQETvm0Ld
 HhtI+kwT9/L/ny2578SQ+/2awrhuYv127eQAAAA==
X-Change-ID: 20261110-fw-devlink-sync-state-f71babbf968b
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Johan Hovold <johan@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794294718; l=2670;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=im/hNd0AVyCdDuE0XZG+ciJxIyRE1L2sv39Qoyr9F+k=;
 b=VlzWbbYyVi5WPSTZS/BfGJ70oOOrABy71NP7acb8J651n3NHp51NssB8U8cUA0L5Xh6DiflGJ
 B/3mufVOdNNBMn8grQFkm+tFxd/kXn7sjYrp7Tb6dvnIKEEMys5j2bx
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

A SYNC_STATE_ONLY device link is refused by device_link_add() once the
consumer has already probed, since such a link only orders sync_state()
callbacks and would be useless. This legitimately happens when a consumer
that probes early (for example the Rockchip power domain provider, whose
domains reference a PMIC regulator through domain-supply) is inferred to
depend on a supplier device that is added later, and results in boot-time
"Failed to create device link (0x180)" errors for a harmless condition.

Log the refusal of a sync_state-only link at debug level and keep the error
for links that matter for probe ordering.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
Tested on an Orange Pi 5 (RK3588S): the three "Failed to create device
link (0x180)" lines that the Rockchip power controller logged on every
boot (suppliers: the RK806 PMIC on SPI and an RK8602 on I2C, referenced
through domain-supply of two of its power domains) are gone, and the
regulators are still acquired and held by those domains.

This patch was developed with Claude (Anthropic) as a coding assistant:
it wrote the code and the commit message, and I reviewed and tested it
as described above.
---
 drivers/base/core.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index bf97b06337a1..4cdfc156ffbc 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2241,8 +2241,20 @@ static int fw_devlink_create_devlink(struct device *con,
 		}
 
 		if (con != sup_dev && !device_link_add(con, sup_dev, flags)) {
-			dev_err(con, "Failed to create device link (0x%x) with supplier %s for %pfwf\n",
-				flags, dev_name(sup_dev), link->consumer);
+			/*
+			 * A SYNC_STATE_ONLY link only orders sync_state() and
+			 * is refused once the consumer has probed. That is
+			 * expected when a consumer that probes early (e.g. a
+			 * power domain provider referencing a regulator
+			 * supplier that is added later) is linked to a late
+			 * supplier, so don't report it as an error.
+			 */
+			if (device_link_flag_is_sync_state_only(flags))
+				dev_dbg(con, "Not creating sync_state-only device link (0x%x) with supplier %s for %pfwf\n",
+					flags, dev_name(sup_dev), link->consumer);
+			else
+				dev_err(con, "Failed to create device link (0x%x) with supplier %s for %pfwf\n",
+					flags, dev_name(sup_dev), link->consumer);
 			ret = -EINVAL;
 		}
 

---
base-commit: ec1db86e7bb3ec13c90456efac43659a723ac068
change-id: 20261110-fw-devlink-sync-state-f71babbf968b

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>


