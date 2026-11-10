Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312077;
	b=oq72PB99EVO78maXPTAdROn9zLvhxNp4KQY44yTZoFapS5NiREHS3wXNKQpyVBfVcxVf
	 IH1LyHSn905oRhHi9nuiFggSRUzue7taOaf2qgnOCA+ismgWtj4K4QdwUKc07kW2aRIJh
	 xNYJuA6VS3p1iPI2FQm8gB7qrU98Wbg5vkngvG8MZmANsfAczFqOgNpL9TYDgegPABSSX
	 ogL/+lh5A4caKn5nu4Xaei/yBElH1oCKH1eR66lsR2IcyjoP0PmhfuTq7qLVWN4s4+XzE
	 28hhtTMEUZ4Y0G3GQYRvEf9kKpsTRkCbyxC2ZLjFHMTK5f546XM1jDTvUu1Ev6TiyjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312077;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+HjTA2u/nFFnlptpw3vP/7vPNz5BhgJXN3PJAfK0Fwk=;
	b=nOAZ1sU0VZ3uapR1CoG0REedCXaMCi4hYKw7J+0i6EVuAWJaAkcUQ15TJdPI0UWIp5P5
	 d0RoqagT5daZLiGUKsygQL5zPC983m/Yy8egcr3i59U0lPO03VIbmqbgGg2RQr8asOYJn
	 yRkk5fos5xGaWq5R6i3++JXSd1K5Eode/7Fi5GQc2h8zVk/3m0nr2n5OEmTJAIf7XDLrc
	 VdV7Lr+11hF6l9vSXvnGEu2mttHBeqXyJ/aSPNK19SoNCMcnL/sYanrbbPG7iwRapeFeW
	 1n6BAV0PedjHf5VgjLrZiiD8hHzm4k7QnH3wXzgMeG029DVYhDH9kUEV/mEZCsnvYzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VIVXVRNy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kc6tR4tf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516D8606A325
	for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 12:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 516D8606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VIVXVRNy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kc6tR4tf
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABA3XL3196055
	for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 12:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+HjTA2u/nFFnlptpw3vP/7vPNz5BhgJXN3PJAfK0Fwk=; b=VIVXVRNywWo5vm8J
	bGdTWBwZbFG5ZXcadzh9nqIX911rWfi/LxdVoACKRPhAuXUI34injqgc4/jDJKVW
	skJHp9WmlwL7TYoIRpY0p/vgyGwsnywuyxgGDwp/z3rDYPWqpBIwpp55Mbyb7WQd
	GbY/5OZYcKjWH5x7oS6Soj2SIpQ15IRIQmmkter4TXPsWMepeA+9ZPf+DJzAYAjq
	3fXElNdasSblOsLx/b62/hOuMndYtxj0AMM5kwNQZYsdJ0jeHfGkeMUUPutaQgSU
	f11Jj1Rr/WmH9OkW8t7Pu9Q7uipQPnMmtGd3EFNgm1n0Eq+Dbf7VPwI2HjrQMR9J
	XVb4Ww==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv03crnb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 12:01:16 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9987bffdecdso1589139241.2
        for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 04:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794312075; x=1794916875; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+HjTA2u/nFFnlptpw3vP/7vPNz5BhgJXN3PJAfK0Fwk=;
        b=Kc6tR4tfmv9jk99tNo5sUYosUPv8i8WOt2e3Z08mIBRTa6tHEotzmfhPZzEYlQTw2m
         LWcwPmfoOLUa9ySKWwuT9gpK8Hgz6C/fce0ZnUrI1bHNdcbSUPl0B5KcPMnpvKnb8KeM
         DdnaKGJnzfYSoeiN0SK1rDwkyN1FZa1m8/VluAo59lfE6sK6D0Ehp0rpleuf9qAvplxV
         /AUET3jvN37iGTOEBMhkMV7Vvn19qL7ebaFGFIELiltr8g2QHXwFGiwVTTgkdcR96j7Y
         GNor1SEg1wv2okGsCGJpRy8D6M0HXN/i57k/gRIcF5H2cRrHuXWAetRivuFWp1PWNVKB
         uzBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794312075; x=1794916875;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+HjTA2u/nFFnlptpw3vP/7vPNz5BhgJXN3PJAfK0Fwk=;
        b=Rx0AvTSP67908G9Oi20slWOpi4PC0jIPa4WwndQAv54gZqmZikwpxKjiy1t3/n2UsC
         L8EC+auhegGyb3dXoLTvc/eyjawC0qsUS2JIgLGBMQeMxHrOhRlu/RSIjJqHbsupLJ5r
         aU2MOE77VHwKxPCwe1Df2e0ziVnlpfYwOad7htDFwfPbKDkswL0scwJ9yxuybO2aUjAW
         jTn2x0yxrcuY/5PDetOpp5WsYoTCCMoqQt48dw9SqExjbSK4m1m3dgUrnDSNJNcWHjS9
         6uTnDah75VslYo+itPqZDtwOYNBiXhpVf5B3Yn+igM0LhCnJ36+y++sL6dTDduUX48GO
         b7lA==
X-Forwarded-Encrypted: i=1; AL+hErE3ZaYahIR0acWkwlOo/DBWffJV0WwlM2Gs5aEmaOHkuCG1gnUkw9GtA3vldKU94eKBhOdvA/fF37ON3w==@lists.linux.dev
X-Gm-Message-State: APuU4Z9m0YHYDp3ve4lOn8CgxAMdyc4N/92iLWKEiBkSpWpQa2GLMF4+
	gl18uxzJ6mGdH2Z9xd8IJz86WzaPk7cuF6cUEB5X7ya/tCMim4om6NTYjq4ff0yALz/SWlmc+Td
	BFjK28oFsxkpLulVlFw+rBlb1BjzkgXw/nE/zgxclB7hCtVPpgRluY5xi8pYtRsz3vG9PLgC0hw
	==
X-Gm-Gg: AYBFou25MyajY3uuEhAluObJEwrV+ozw5VmZEfdKCJP7PIBhjwpVhvtTbkQVyPD+lo1
	iNy+0y5yEYtXQSOtgji3Gj3lGpytMjyEhXMDf6uzvDMu8PZD0mFkatgHuG37TbXqSCMo5xwKPbW
	jtkASArZspwT2X6gJncN9HWIkHL4jCD8nkPw+BeSSLfd5LvcOvmGU2Bk/Kmn3taD8ymuaUn8fCf
	HSmWcW1ph8sMfYmFjtG5+v3reMVYJzD8lP3F2FPS5sJmVaDyLIIJTncruucHRmVibJG2RHJgA8D
	ZBcWJZcdlWbd9W5IJBzhhiSibcX96n4UxBbdTU7wh2VTRCagY6wCk6wk0LYGbfUtekWg/JboYS5
	MkFONsXo2z+62ljMzayCRcGNYMB0ogb91OQndgVbVNBoND0iijeZ6h9umrlFSVtP9uvGsqzSIcA
	gV99HIu+cEf2qak/RKkFDqRqK5vovDZzT9iRdniA+dQK/BSNfgad0Gy3HUtPGVuhlpkKymc/YTF
	D3KfjQzrhADEGGM2et7wFEXyC8=
X-Received: by 2002:a05:6102:54a3:b0:7cb:70ed:ff90 with SMTP id ada2fe7eead31-7d301c1a4b4mr947571137.26.1794312074958;
        Tue, 10 Nov 2026 04:01:14 -0800 (PST)
X-Received: by 2002:a05:6102:54a3:b0:7cb:70ed:ff90 with SMTP id ada2fe7eead31-7d301c1a4b4mr947517137.26.1794312074188;
        Tue, 10 Nov 2026 04:01:14 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:a91e:6b1:bddc:2951])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe2cb2sm56820295e9.3.2026.11.10.04.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:01:13 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 13:01:08 +0100
Subject: [PATCH v2 1/2] PM: clk: Derive PM clock locking from the device's
 IRQ safety
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-clk-leak-v2-1-d044cf0c3f1d@oss.qualcomm.com>
References: <20261110-clk-leak-v2-0-d044cf0c3f1d@oss.qualcomm.com>
In-Reply-To: <20261110-clk-leak-v2-0-d044cf0c3f1d@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-pm@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: OUyrP50HxY4SWpU1dxvt-DXn5NSBgnCf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0NyBTYWx0ZWRfX/BAgFPewChvL
 6zP/ZLEFVVN3DsLWYmOgno7YoeKZGR2TzmqDgpNjHu8jbVtg/vfoiUx1hw7ckbBx2SOYgfUCKOO
 k/0cAJda0fyFfjyl5+Bdll0aHlJ7ZFk=
X-Authority-Analysis: v=2.4 cv=FuiQbGrq c=1 sm=1 tr=0 ts=6af3078c cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=axtgUO-RdfAEZTjPD4QA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: OUyrP50HxY4SWpU1dxvt-DXn5NSBgnCf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0NyBTYWx0ZWRfX9j7JyJYUhVad
 /BXt+VXL3Jlvw4W8a7hufQJeI1jfEVu+ebnDyaZwql8FcM1UMMfDBdXpaQugVHlPollgxjCnbWr
 9ptrpLJOHuhFcolvVd0P5Ra2NQExxApbYjhnxA9asn+QVOuic7DCjgfyUVs4EVaV1zEzULMgrk5
 OsWYKu4TF+/q6s17OxJxtcIqd1pj92L8ntcKdas1UksCO+p/48lC8C31mKMiX6kmBBttKwce8KU
 FIXAKHfRnT/nqBCr3YL/u53qrjTj1sQcxjciSaVi88fgq0NmMctCswok+FUzSBc5GeZiYszKVhz
 d7GhPNRSWpH42KqXEy7VaQeUhr4X7gKoNV9fD8FgodDsQULOUxAt2qmFmsi5KdxQichiIwiCVGz
 8/bk0txtpEhIoBv1fdbeXWiD7NlV/sLeRhYuWctjxB9tggfb2lc8qUoHg1O2MXnIZkWd+iBlXGu
 1shLk3i28R2/0fgOaNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100047

pm_clk_suspend() and pm_clk_resume() take the pm_subsys_data spinlock
when every clock in the list can be gated atomically and the mutex
otherwise. That is tracked by a clock_op_might_sleep count.

Whether the operations may sleep is a property of the device rather
than of the clocks though, runtime PM only invokes the callbacks with
interrupts disabled for an IRQ-safe device.

Use pm_runtime_is_irq_safe() and drop the count, the retry loop and
the caller name argument. Devices that are not IRQ-safe now always
take the mutex, which is legal as they only suspend in process context.

The count also rejected an IRQ-safe device holding a clock that is
enabled when prepared, with -EPERM. __pm_clk_enable() now does that
instead.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/base/power/clock_ops.c | 135 +++++++++++++++++++----------------------
 include/linux/pm.h             |   1 -
 2 files changed, 62 insertions(+), 74 deletions(-)

diff --git a/drivers/base/power/clock_ops.c b/drivers/base/power/clock_ops.c
index 3b8ba27802a800bac29abd8e21756ccdb0f2a716..6f66e11a12428fb718abca197f5519b1ee21ff90 100644
--- a/drivers/base/power/clock_ops.c
+++ b/drivers/base/power/clock_ops.c
@@ -40,14 +40,13 @@ struct pm_clock_entry {
  * pm_clk_list_lock - ensure exclusive access for modifying the PM clock
  *		      entry list.
  * @psd: pm_subsys_data instance corresponding to the PM clock entry list
- *	 and clk_op_might_sleep count to be modified.
+ *	 to be modified.
  *
- * Get exclusive access before modifying the PM clock entry list and the
- * clock_op_might_sleep count to guard against concurrent modifications.
- * This also protects against a concurrent clock_op_might_sleep and PM clock
- * entry list usage in pm_clk_suspend()/pm_clk_resume() that may or may not
- * happen in atomic context, hence both the mutex and the spinlock must be
- * taken here.
+ * Get exclusive access before modifying the PM clock entry list to guard
+ * against concurrent modifications. This also protects against a concurrent
+ * PM clock entry list usage in pm_clk_suspend()/pm_clk_resume() that may or
+ * may not happen in atomic context, hence both the mutex and the spinlock
+ * must be taken here.
  */
 static void pm_clk_list_lock(struct pm_subsys_data *psd)
 	__acquires(&psd->lock)
@@ -70,72 +69,51 @@ static void pm_clk_list_unlock(struct pm_subsys_data *psd)
 
 /**
  * pm_clk_op_lock - ensure exclusive access for performing clock operations.
+ * @dev: device the clock operations are performed for.
  * @psd: pm_subsys_data instance corresponding to the PM clock entry list
- *	 and clk_op_might_sleep count being used.
+ *	 being used.
  * @flags: stored irq flags.
- * @fn: string for the caller function's name.
  *
- * This is used by pm_clk_suspend() and pm_clk_resume() to guard
- * against concurrent modifications to the clock entry list and the
- * clock_op_might_sleep count. If clock_op_might_sleep is != 0 then
- * only the mutex can be locked and those functions can only be used in
- * non atomic context. If clock_op_might_sleep == 0 then these functions
- * may be used in any context and only the spinlock can be locked.
- * Returns -EINVAL if called in atomic context when clock ops might sleep.
+ * This is used by pm_clk_suspend() and pm_clk_resume() to guard against
+ * concurrent modifications to the clock entry list.
+ *
+ * An IRQ-safe device may runtime suspend and resume with interrupts
+ * disabled, so for such a device only the spinlock can be taken and the
+ * clock operations are restricted to the atomic clk_enable()/clk_disable().
+ * Any other device is suspended and resumed in process context only, so
+ * the mutex is taken instead and the clock operations are allowed to
+ * sleep.
  */
-static int pm_clk_op_lock(struct pm_subsys_data *psd, unsigned long *flags,
-			  const char *fn)
+static void pm_clk_op_lock(struct device *dev, struct pm_subsys_data *psd,
+			   unsigned long *flags)
 	/* sparse annotations don't work here as exit state isn't static */
 {
-	bool atomic_context = in_atomic() || irqs_disabled();
-
-try_again:
-	spin_lock_irqsave(&psd->lock, *flags);
-	if (!psd->clock_op_might_sleep) {
+	if (pm_runtime_is_irq_safe(dev)) {
+		spin_lock_irqsave(&psd->lock, *flags);
 		/* the __release is there to work around sparse limitations */
 		__release(&psd->lock);
-		return 0;
-	}
-
-	/* bail out if in atomic context */
-	if (atomic_context) {
-		pr_err("%s: atomic context with clock_ops_might_sleep = %d",
-		       fn, psd->clock_op_might_sleep);
-		spin_unlock_irqrestore(&psd->lock, *flags);
-		might_sleep();
-		return -EPERM;
+	} else {
+		mutex_lock(&psd->clock_mutex);
 	}
-
-	/* we must switch to the mutex */
-	spin_unlock_irqrestore(&psd->lock, *flags);
-	mutex_lock(&psd->clock_mutex);
-
-	/*
-	 * There was a possibility for psd->clock_op_might_sleep
-	 * to become 0 above. Keep the mutex only if not the case.
-	 */
-	if (likely(psd->clock_op_might_sleep))
-		return 0;
-
-	mutex_unlock(&psd->clock_mutex);
-	goto try_again;
 }
 
 /**
  * pm_clk_op_unlock - counterpart to pm_clk_op_lock().
+ * @dev: the same device previously passed to pm_clk_op_lock().
  * @psd: the same pm_subsys_data instance previously passed to
  *	 pm_clk_op_lock().
  * @flags: irq flags provided by pm_clk_op_lock().
  */
-static void pm_clk_op_unlock(struct pm_subsys_data *psd, unsigned long *flags)
+static void pm_clk_op_unlock(struct device *dev, struct pm_subsys_data *psd,
+			     unsigned long *flags)
 	/* sparse annotations don't work here as entry state isn't static */
 {
-	if (psd->clock_op_might_sleep) {
-		mutex_unlock(&psd->clock_mutex);
-	} else {
+	if (pm_runtime_is_irq_safe(dev)) {
 		/* the __acquire is there to work around sparse limitations */
 		__acquire(&psd->lock);
 		spin_unlock_irqrestore(&psd->lock, *flags);
+	} else {
+		mutex_unlock(&psd->clock_mutex);
 	}
 }
 
@@ -143,26 +121,44 @@ static void pm_clk_op_unlock(struct pm_subsys_data *psd, unsigned long *flags)
  * __pm_clk_enable - Enable a clock, reporting any errors
  * @dev: The device for the given clock
  * @ce: PM clock entry corresponding to the clock.
+ * @sleepable: Whether the clock operations are allowed to sleep.
+ *
+ * Returns -EPERM if the clock can only be started by preparing it while that
+ * is not allowed here.
  */
-static inline void __pm_clk_enable(struct device *dev, struct pm_clock_entry *ce)
+static inline int __pm_clk_enable(struct device *dev, struct pm_clock_entry *ce,
+				  bool sleepable)
 {
 	int ret;
 
 	switch (ce->status) {
 	case PCE_STATUS_ACQUIRED:
+		if (!sleepable) {
+			/*
+			 * An entry left unprepared is an entry whose clock is
+			 * enabled when prepared, so it cannot be started
+			 * without sleeping and the device must not be
+			 * IRQ-safe.
+			 */
+			dev_err(dev, "clk %pC cannot be enabled atomically\n",
+				ce->clk);
+			return -EPERM;
+		}
 		ret = clk_prepare_enable(ce->clk);
 		break;
 	case PCE_STATUS_PREPARED:
 		ret = clk_enable(ce->clk);
 		break;
 	default:
-		return;
+		return 0;
 	}
 	if (!ret)
 		ce->status = PCE_STATUS_ENABLED;
 	else
 		dev_err(dev, "%s: failed to enable clk %p, error %d\n",
 			__func__, ce->clk, ret);
+
+	return 0;
 }
 
 /**
@@ -223,8 +219,6 @@ static int __pm_clk_add(struct device *dev, const char *con_id,
 
 	pm_clk_list_lock(psd);
 	list_add_tail(&ce->node, &psd->clock_list);
-	if (ce->enabled_when_prepared)
-		psd->clock_op_might_sleep++;
 	pm_clk_list_unlock(psd);
 	return 0;
 }
@@ -371,8 +365,6 @@ void pm_clk_remove_clk(struct device *dev, struct clk *clk)
 
  remove:
 	list_del(&ce->node);
-	if (ce->enabled_when_prepared)
-		psd->clock_op_might_sleep--;
 	pm_clk_list_unlock(psd);
 
 	__pm_clk_remove(ce);
@@ -384,7 +376,7 @@ EXPORT_SYMBOL_GPL(pm_clk_remove_clk);
  * @dev: Device to initialize the list of PM clocks for.
  *
  * Initialize the lock and clock_list members of the device's pm_subsys_data
- * object, set the count of clocks that might sleep to 0.
+ * object.
  */
 void pm_clk_init(struct device *dev)
 {
@@ -392,7 +384,6 @@ void pm_clk_init(struct device *dev)
 	if (psd) {
 		INIT_LIST_HEAD(&psd->clock_list);
 		mutex_init(&psd->clock_mutex);
-		psd->clock_op_might_sleep = 0;
 	}
 }
 EXPORT_SYMBOL_GPL(pm_clk_init);
@@ -433,7 +424,6 @@ void pm_clk_destroy(struct device *dev)
 
 	list_for_each_entry_safe_reverse(ce, c, &psd->clock_list, node)
 		list_move(&ce->node, &list);
-	psd->clock_op_might_sleep = 0;
 
 	pm_clk_list_unlock(psd);
 
@@ -472,16 +462,13 @@ int pm_clk_suspend(struct device *dev)
 	struct pm_subsys_data *psd = dev_to_psd(dev);
 	struct pm_clock_entry *ce;
 	unsigned long flags;
-	int ret;
 
 	dev_dbg(dev, "%s()\n", __func__);
 
 	if (!psd)
 		return 0;
 
-	ret = pm_clk_op_lock(psd, &flags, __func__);
-	if (ret)
-		return ret;
+	pm_clk_op_lock(dev, psd, &flags);
 
 	list_for_each_entry_reverse(ce, &psd->clock_list, node) {
 		if (ce->status == PCE_STATUS_ENABLED) {
@@ -495,7 +482,7 @@ int pm_clk_suspend(struct device *dev)
 		}
 	}
 
-	pm_clk_op_unlock(psd, &flags);
+	pm_clk_op_unlock(dev, psd, &flags);
 
 	return 0;
 }
@@ -508,25 +495,27 @@ EXPORT_SYMBOL_GPL(pm_clk_suspend);
 int pm_clk_resume(struct device *dev)
 {
 	struct pm_subsys_data *psd = dev_to_psd(dev);
+	bool sleepable = !pm_runtime_is_irq_safe(dev);
 	struct pm_clock_entry *ce;
 	unsigned long flags;
-	int ret;
+	int ret = 0;
 
 	dev_dbg(dev, "%s()\n", __func__);
 
 	if (!psd)
 		return 0;
 
-	ret = pm_clk_op_lock(psd, &flags, __func__);
-	if (ret)
-		return ret;
+	pm_clk_op_lock(dev, psd, &flags);
 
-	list_for_each_entry(ce, &psd->clock_list, node)
-		__pm_clk_enable(dev, ce);
+	list_for_each_entry(ce, &psd->clock_list, node) {
+		ret = __pm_clk_enable(dev, ce, sleepable);
+		if (ret)
+			break;
+	}
 
-	pm_clk_op_unlock(psd, &flags);
+	pm_clk_op_unlock(dev, psd, &flags);
 
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(pm_clk_resume);
 
diff --git a/include/linux/pm.h b/include/linux/pm.h
index ef3f1310e749c34d4aff75a2fd7e95b9f2ef3a10..c38c59b8a52831ea44ba3ce89217c99a616adda9 100644
--- a/include/linux/pm.h
+++ b/include/linux/pm.h
@@ -636,7 +636,6 @@ struct pm_subsys_data {
 	spinlock_t lock;
 	unsigned int refcount;
 #ifdef CONFIG_PM_CLK
-	unsigned int clock_op_might_sleep;
 	struct mutex clock_mutex;
 	struct list_head clock_list;
 #endif

-- 
2.34.1

