Received: from sonic314-22.consmr.mail.ne1.yahoo.com (sonic314-22.consmr.mail.ne1.yahoo.com [66.163.189.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2861D1AE877
	for <driver-core@lists.linux.dev>; Sat, 28 Feb 2026 06:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.189.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772260327; cv=none; b=NqcO5FXZbp08j9kZFyRCX5kefcN8hlEkLNpw6ANtAvYi3izWTYNK0ttqQS5FA4AqYakoEI7C0HVdNlJ+Bho/tLUjMo4hWi/H7ZEEAlDH0/qbOKNQVWt/7hQqXkaqNU+SU0RngwjhlYrOKFoKg87O61PGhbs6swjHFuiyLzhnqAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772260327; c=relaxed/simple;
	bh=z2wN2KKVoKh7Q7YE3xbwuIur6yG91stML1MSjRKawHM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=eK3zYZn/Mmurhw/+1OEnt+000HnY9DQ25uwBx7jEp4QcsWtSmeiJgWLYVkE1EC9fS+Bbg78UGGVJhX0Wx3riv9A4Ge22OaxdXY+CcCMz5By3DDdZ1DQGVbFKDY4pYrdIS7d5fONBpmwAfDJpzjn3tcfgjpY7Y4hSbNJVIqAE6bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=smGOARL5; arc=none smtp.client-ip=66.163.189.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="smGOARL5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1772260325; bh=0SO3jTBjZqUQa10d08e1ztHilTmdsfnxtuap7dA+2J0=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=smGOARL5nG6elqdJN2Et6w/OfF3q3eqtiLhV12sExDWDf+LI7pid/8cgixuWFv315fi32myfTpf06su5OncxPdp6XISQAeugmSI1qOv8V2E7Cz4KDCMwx1iw3ftHZzxmio7UWOh0faqDI4et85mXR5zQKe2E2PmIsAODLoUW3IHK7L+adgEf+ARcOp2fZsVNxUUtasrfhMZ/LC8ZtqW9X8JuzBQ7M4O9Z1krEpLGiIR0eoPEAAnE4Dzb8pRzUUsvXJhNS6GAEB+Y+qrop2MAFpqixkVlP12M6GT/MHYgt4uAI+VkbAoxC1bs9eDQMjjpwBfVY0bO/W56H2hg7/6mkw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1772260325; bh=y1P3MDkRbWN4G0L3fk7tkmSeMlQGIfdEdZcfmR5yGxu=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=FBKk6tqMZoF/7r83kx/4RReTNiSuggLwAqb9vA7S0EasLPa5vbz5Wn6Gdk7qjzqICpRnlv3BxGe8hqGexATZWu1YVOKMW2OP4J34V/WqHUAyZrA6ukYCx8X3eamfPNkUejZNtl6wrDFbpI5Gh2ridM7rWJKc2Ju5Sqow4jARmsUCTKcpu3QRsGvdY+rYtGyu1T2juE8XMoQKyHpDUKmY+C3Y/eOdfghmDLQYHkx7O87shKU5NS1IlsPjWxufpgXG47mpWZh7NV+YKzJFEm9pAGrjjnNg1oyqARiL/qbZ3wquJROL4gDj1NO1KDxWRj4mKSRdIvC8LXNaQ9G4Sg7aLg==
X-YMail-OSG: WBg1Z44VM1kfpqNTGxetLuUxKHodi_0APXhT4bzDqBd4QGGI5maEF7wtjk7cdsc
 2Yzr3Z3Gz.MgF1DOuSZE48ey2Fl_.dpr1QGpL9aYKmgxeEPtgsl4E_t.dbs0M13Je7Mgu1KYIbcz
 A.hRi8iy7dkKaNsSCrejWj7caFVmdTmYwnKhBXEL9sd52jSXkzcUCfCYB5QYm1VcNy46ggDzf4ZP
 H0B4oZXkwq_ghMe7FzKuUE0HZIrWWDJVLXOcB8cfLhFjsq.3Uno7iMJA9F9vbOa1vi0clWKIQmBe
 T_Ymdj5SqgxWG6sekaNvOgyHoNrBY5OAMY6Jcztz1F728KrDKepsgLimVD6LtWj21AxdNOBw9fQa
 xeoMSfG3Yhh4lQePDJI8XRjHJF4gVKttpiYbkQ4nA25WK9eRj75FzKMwma3xoAMVbWxRJeXTCrUP
 cWbZjsT0nM8bE1uFVJk1EyoCoiAkGh50DUv1O5YISXXopVpriEXCGovNAuhFL0BlJoNaKse1CZHi
 Ijjmz_SaPPAtcbOzeEtYCshv4JzX2iFsCIf0W34RIBbtnPiRgH1aEbp6i4XAhAQcZwtudL7gxY8_
 ocx89RcnczrwDP5gGYrRHxFIbPyzyNgk4gVXADoVLsccRHGW7Ik7KGZF9v.n6hBSNS3jpd9N_Xcr
 LWIYlyl0gP_UJQgO3JsLGah1NL4cPhr4Hon06Wzx_dU0XYQYRSkVabQ8L2c5OCWNfx2NnaeaMPLK
 .5O7NpWJaOWd14MsUFsCS3AYLO7d1Avv737UElpS.zO1Z7nMUNLatu_N9OT7XmsuHZKtiSaMFHmI
 EANu67HHTKUvcSR1EXJr_XiOrhV4YWYBCQOVR1FBMnfrD9okWRiEg1hcEUkGQGypIXp_iV8Ozvr3
 hR6BN3RGkbqvb_Wl3gjr1nYtUV5EsZHKwbiXpYjWLEa_XNHnlQ3tXHkQT5_2QPj70Jv78VCUJAKy
 y88Rxd96iuTV8FmboRWznVh7VEH_sjpmaS79pqk1UgWwBPrJOqoXMkEG4RKz0qoH2.qY7viGP66o
 NCj55zGkC3c_Ow1lLPIr55wPjp.SUd.TxtzLPo4uzEwCflhim1w5q0aLQktL_hrMHW7pKWDbfksN
 QfKqKCYccoHhdA12BasCka4unI.MY8cO1dT6Oiqi3v1hrbnMbCec3gCWsAVynjqf6QQUrscS2WKL
 qc4rIviYpx6KH.4AhzN2.Mee8m9vFgqsbO_iDNzQj83bm_bUP9BcX8.bc1tbvpISgqnO8DYwHP.a
 IIpj7teVaOTcsWigivJKnJ3nfQLO0F4FKu5E2uAimSFdpj2gl5QMFSjLL6Du7EXPx.rW_uxFvuOG
 9nLHDftRCBVAMkGipVH9vA4LbVQwQQGUFdqd3uZthFBMqbejBo3SRnHWDCwgH7F5u7SutNYp7UJn
 AzhiZaiyEBfRnFWv6fVCBU9rzwv47E_nPi3lIM9JUkutMGR59uhUbZUCKaGfamPP.KEEL.JJRvpy
 ApgJ0X6.PxQXbpKD4OrCDPubbuMtlh8IfxNTx9V1pw7ib76i0OjuTRHjgotRXxhxc8aLVJkZHGFN
 Fg3Y8jNoRJGDQ_vTtnfyvsoVMRIy1iAjRyn6qBTDMGpeT.6cCnSXI0GfnMa4cJ2h2DOTKrPX7hLT
 xmMtLul5LImF4wm7wUi1550wksGaoMIRVce5seSQF6VvOtjxLiRVB7UB9UbUudfIinyD92bhx5sU
 SPly3nVH8bLEZVQ4VD9BMEYfT6zuFYgpnxs.GAuiGX1uPhYAmYB5Uu6IoM6Bj15MXXAe4thYLhD4
 .dOdI2g2vli4ZUevV8BnrMOPCGow_ssVYoAeHS.9l8M3rxZAPCTx5UOK_jKSjnyA96hQvSio4krA
 my3V_MI.KMmOTUgkIf5GL6JajbPD_Yc7hCApEXN8KabjVBbD5Fm7eTv1N0q2Tq_UKBT.vuexav2j
 nJQbBisgw6H9P_3g.iRs.Rc1PxvZl4oaAU3I46BdmiDGmygBB1B1B73HJ1vivair8hqDD7AAwjex
 EEb2DPpijHY2semZLeZgzkG3SY49BoWD9sbDsCqf9EShAlFA7axek5YmrA8g_Dc_PobXfFM25Qrr
 ftPivUmKCZ9tyJtlPH9nkOYVhUAIFkJxFmM3YY7iff8Fb8mQWdbhYPjOSlsFHn9M836jGkI_h43a
 XEJGWsUl6An7AkvB6qcJ085r5hpxpI1wQvse6qZ1nRMUUo8vMqraytbkZqFKB8168xKUODdi_kQC
 lFk01CXqLdrgFXCWWYnB6oLtPNRxBHXk243.KOo0qQwjvt7_sZyGNY8M_kyVR9yb3Xc3rDF0JDGF
 m81DGW02kkzTAkAI36iMXYzw-
X-Sonic-MF: <abhishek_sts8@yahoo.com>
X-Sonic-ID: cb8bf0df-a453-4d7e-9d8e-c8bcd23ed068
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.ne1.yahoo.com with HTTP; Sat, 28 Feb 2026 06:32:05 +0000
Received: by hermes--production-sg3-6959968fbd-dlxk8 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID e5548eb4ff6e38c9a884ee7b4f2e1165;
          Sat, 28 Feb 2026 06:11:46 +0000 (UTC)
From: Abhishek Kumar <abhishek_sts8@yahoo.com>
To: mcgrof@kernel.org
Cc: russ.weight@linux.dev,
	dakr@kernel.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	driver-core@lists.linux.dev,
	Abhishek Kumar <abhishek_sts8@yahoo.com>
Subject: [PATCH] firmware_loader: Add null pointer checks in request_firmware_nowait()
Date: Sat, 28 Feb 2026 11:41:36 +0530
Message-ID: <20260228061136.6472-1-abhishek_sts8@yahoo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20260228061136.6472-1-abhishek_sts8.ref@yahoo.com>

Add defensive null pointer checks before calling get_device() and
put_device() functions to prevent potential null pointer dereferences
in the firmware loading subsystem.

Specifically:
- In request_firmware_work_func(): Check fw_work->device before
  put_device() to safely handle cleanup when device reference may
  not be initialized.

- In _request_firmware_nowait(): Check device parameter before
  get_device() to validate input and prevent reference counting
  on invalid pointers.

These changes improve code robustness by adding defensive checks
against edge cases that could lead to kernel crashes.

Signed-off-by: Abhishek Kumar <abhishek_sts8@yahoo.com>
---
 drivers/base/firmware_loader/main.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/base/firmware_loader/main.c b/drivers/base/firmware_loader/main.c
index a11b30dda23b..3395ba3d9066 100644
--- a/drivers/base/firmware_loader/main.c
+++ b/drivers/base/firmware_loader/main.c
@@ -1150,7 +1150,8 @@ static void request_firmware_work_func(struct work_struct *work)
 	_request_firmware(&fw, fw_work->name, fw_work->device, NULL, 0, 0,
 			  fw_work->opt_flags);
 	fw_work->cont(fw, fw_work->context);
-	put_device(fw_work->device); /* taken in request_firmware_nowait() */
+	if (fw_work->device)
+		put_device(fw_work->device); /* taken in request_firmware_nowait() */
 
 	module_put(fw_work->module);
 	kfree_const(fw_work->name);
@@ -1194,7 +1195,8 @@ static int _request_firmware_nowait(
 		return -EFAULT;
 	}
 
-	get_device(fw_work->device);
+	if (device)
+		get_device(device);
 	INIT_WORK(&fw_work->work, request_firmware_work_func);
 	schedule_work(&fw_work->work);
 	return 0;
-- 
2.43.0

