Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A38C3B636A
	for <driver-core@lists.linux.dev>; Tue,  7 Apr 2026 13:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568496; cv=none; b=Vxn8OR0WUKrUPc7NFfGUXLW+QuNQkNokaMzXoF2PmeNjDeWHOCEBlJSt2ZQ828jsQMGNOmAIBALyOotVLyVFHYSykOLhpcvjr1f2X9WjIylIxoz+lDs6Kw3t5gtZzBOOoJ7Eb/B8xd5TtLkaN2+97SphfeoIuldybJqDje23HhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568496; c=relaxed/simple;
	bh=hmYdGZ8QpnFOuKeBACyvFyEsCOerFDJssZtlQSsutkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hWercYwSbS6T517Xcr9zmfayH5BUhvNXfQ04V/Rf7yoIWmU7n6IzrLGWyr1vH0AmZ4b3r1CAuIiLHn409vcZN2H0pnATWh+2kAptakYv/t0nv74F0nu/qouyOGA10oxU1SbQbFCcliMecLfp4LU9TgvtcuoeYBwnCmfM4YRFDKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MLfpq7QY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LZhFooGs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MLfpq7QY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LZhFooGs"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637CuikT3402569
	for <driver-core@lists.linux.dev>; Tue, 7 Apr 2026 13:28:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9liLF/qYXrQRfW076cbmGme0YBi1d5hYrDISi+SmGbg=; b=MLfpq7QYllDjY0ZM
	SIHS3wCWLtMZ7+OxG/CJTumykAa7Elpe7PryoJzPlCseiK/akd7reagxujTUjjyo
	pg6OSFmOLvJ80W3P2u3QXZQSBGwbmlYwgk0na1lSvGYpARWgtnEQtLl361LZNO2h
	qUm7TjaOL3cR9W2qZsQORvc1ydWVrIUnq8VPghh8JnjDN4qIPJDfhnTisZLgNFFr
	B+sNe48l1552wvMr4nHy4jMEY/4gGNWcgMRnSsRAtdQXyUDvMX5ezODVR+dd6Rt2
	cmOMJjPROf1NQDZj+Jmw7PBKAtJ9nSarSYnbislIYqvR4OwS8PDWqaoYcRtZJ+Jb
	VHC2Mw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrhtvae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 07 Apr 2026 13:28:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d76f460b2so43034901cf.2
        for <driver-core@lists.linux.dev>; Tue, 07 Apr 2026 06:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775568493; x=1776173293; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9liLF/qYXrQRfW076cbmGme0YBi1d5hYrDISi+SmGbg=;
        b=LZhFooGskb/nlhcfpakY/Y1hfAYeySmKAc6ZQBqe+Kg12PsHfuUQWVW+bAmPxBFhwn
         Vgskbtm3EQshgyp3ENzjUXCL+YQiS5hICJeyUyLQ1b1alIjCHxwu+aNSOXnOuvxMOWmr
         AJtietWIUqoxr+FqNORaI5Na5l3NVwi+ylrcxVR4/Jf9rliq4UK5Kqeg6irFnElp77/9
         wIGZ1vM4c6/cTVJ6aeIAFnwB8eqXIraELLWuVHqGcwdIPH3DBUE8Fpvx6cnfl4N+MtHc
         vyzusmSaix7gUX+JzynYXi/Zb4IjaqLU4SZO9opYXfm7/S3DJnj370I15KBArXDrLCUE
         cZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775568493; x=1776173293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9liLF/qYXrQRfW076cbmGme0YBi1d5hYrDISi+SmGbg=;
        b=SivtuBFxjCR/zEIdOtNuAPXKPfE8BVD/xiQYXyNn8xkaFU3l3kK9OnfEMPSzfvHGGV
         DC69XUItZztdSy84SLZziIMXcv/MrC0oUoAOCO0oc64TsxECDbspvfNBhXSlivI8YXHv
         frdzS+EoVp1pg27+3c9kk2CG5VQLz+UwqgaAZlHkXW/HZdwk4jpxr0jUL48/w2+eGkVl
         PncFTk2Wg3jS557pOvI7gEGgXfvbLRpptBe97mEzSrPcZMLI440JZD/ebE5bmmD06FC6
         eQVlYD189qk9ZTLQGAWoos7bY9BmXNk61ptRvIvQz8gmEDzJllBbnVp7pu6VGgLkNOEh
         Z2sw==
X-Forwarded-Encrypted: i=1; AJvYcCVW2+OuGAuHGcC1+mRvxO5d/JFuHhdLLspmimNckhVjzrmiYI8KIqOalRoEWRAkV34WmGAi1/He6F9vog==@lists.linux.dev
X-Gm-Message-State: AOJu0YwWwOxnEB0IG2PwlmKCsvynunuItK/CBGaPuaMM9f7tqmPvwmlE
	dy/2TpqNAKjsplpllVHtOHBP6yR3E1U/+wJq03TAo8APIX2nmZM4HKyxc0h3qhGdLKTH6gCZcN/
	0D/f9m97dKbX2MmWeQkfLaeucQZHAs24RbwHggzgyHE0FSFr4hY+ZUgBDGojuXHP7ew==
X-Gm-Gg: AeBDievLGKJ2DL/dJFqI7kE+kTHgmscS7h/ACarngvcUfyb4IIhPfrDXF5Bk6befYQR
	yjf4dgclEoubGWm3G4Zn2WBfuwA/2D8vQgiTxWq948JsJ6qItlZp2+h8PTwLP5YWHBdaS3iWx/w
	b2TuOT45sJ3s3I6DAzfwrS6wnbX6XncvZ8/aBx+R9P57Afrb4KeauNQ394XfSWZvF2WZlydtAJd
	9m1wUXZ7VbWugTfzBqqfCim3AbxzhRlaklwglWgDrPqPHEGDsZq2JTmTxUxAbHrzlZ2HigxfM8e
	+L8oPEH5niwKGsFEhI+lvGsPKtL7zddGBdE9U98OQMAyhmb8E/wbkZNl7U2yP4f/oPtBUaDG4k1
	lxsfhJ4mKAn3Wn8uQQWNBT6w1JpXmK7DptZzYtPkCziVgKZJbsIs=
X-Received: by 2002:a05:622a:4106:b0:50d:7a6c:7d4a with SMTP id d75a77b69052e-50d7a6c8951mr191328231cf.31.1775568493534;
        Tue, 07 Apr 2026 06:28:13 -0700 (PDT)
X-Received: by 2002:a05:622a:4106:b0:50d:7a6c:7d4a with SMTP id d75a77b69052e-50d7a6c8951mr191327611cf.31.1775568492894;
        Tue, 07 Apr 2026 06:28:12 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:b36f:5370:5f91:2d5])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cccd2dsm4073807e87.67.2026.04.07.06.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:28:11 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 15:27:57 +0200
Subject: [PATCH v4 1/2] software node: return -ENOTCONN when referenced
 swnode is not registered yet
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-swnode-unreg-retcode-v4-1-1b2f0725eb9c@oss.qualcomm.com>
References: <20260407-swnode-unreg-retcode-v4-0-1b2f0725eb9c@oss.qualcomm.com>
In-Reply-To: <20260407-swnode-unreg-retcode-v4-0-1b2f0725eb9c@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Len Brown <lenb@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2195;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hmYdGZ8QpnFOuKeBACyvFyEsCOerFDJssZtlQSsutkA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp1QZkjA7X1+jc27SHeZAK7S1NEcKZXxUiPVu0U
 wtyyi+csk2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCadUGZAAKCRAFnS7L/zaE
 w+leEACnZABJzFjgUe801nNvDd9J625XE4Ufxm6zNPtDSZPwoBpkoqY+sXqtHY9NWff2zOKp2gF
 WdCK5Q/REfC+Ha7bdGdeWeJ3yS/+Gj1IIOJCJIpMAsbZm2TIz13/l54D2Y8ihOQl65rBxRsEBwT
 A93IuL2OzHhqj/KS+DFfBhHsLy0WoJWw00e4hT/dA8eLNmVrA25vOEnGqfMFsiDS8U+zqYeKsBK
 UIAXYmjsJytLXtJguzC1JDWUf7qeGbFFmNwLEXQRY3KadwzqwISCItcIclLbuUB1DaKrCTA3FM8
 6Yz5/OixAHYD6G/oGVL+PkAAw3KVIYc9fbNwR1JVaWOhRH4VbyBMK4bavqvPSoOUyAVwiydO6xZ
 icwm21qpZcx9GGu6l9A03Gy5xp4wt/LqMlWX+JB3qf5mZUYb5O9tS+xwWedQhxdxiwEPQ8WmhMf
 ejrRaRqxfFBrcUCZS7R1lp+n+BDPn7/6szRNq2uuia9j1+0IfbpRC2i+jc97MrHONK0ANMSydLT
 +MrMWPBfCOb5aSru7GnPiWST88G9KMhQ7gTezWVW4zPTCbXOGSGkar76Eg3kndXy/HL6QzgdTOT
 A/Yn8KiP2N/CeRwWJEJB73rzB80CytsMI4BCmCcoNZaIL43b2y19by6MejUBafCVCZikLuIA1H7
 0I6tA1MR3U3qZPQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyNiBTYWx0ZWRfX5auNnhDgHUF9
 J7n/LCHZGowDtlPU/KDIV/g2ulQHSDz+M/eyJ5NU/UjDUgORCSYiaOOtlTjOcXL7OpibHAW36zN
 E2BeTQWR1F/qzUf5MHD+GmLam/HOvHwI1jwelMxqrTrYlkhQda/bYkc67pmVvK3VERhpXwA6V0j
 sPWSRij2Id2qwoRtZCILj9P1Tduq9Sf52lT9G2h4kL6HomE5oYD86rOK717ai/eBIwsxg9Hd9RO
 Kgl+1FS/K7jWRzWh/+ZuX1pvF69BB9kZYjqcYUO3r6Eo9rCuaaETguredhPMHslSZxwvmRLLTxU
 jmbSNVT7unsMN0KmR52v3IBxb9Vid8vnNUq45cDhIFs/716bLR++Elrdhow2xCA3J13HfR62tWj
 3oNYvoeh9UWpEzlG965yYnFiH9zeI4aYX5cuYA79yKyU52J3yS4qJwkcX4XpU8XYTPLo03N46BB
 JPHd8UT++NUJFzIciuQ==
X-Proofpoint-GUID: KlDF1tEuqTWWZv3f9LmDcxaTJaiKDstc
X-Authority-Analysis: v=2.4 cv=XPUAjwhE c=1 sm=1 tr=0 ts=69d5066e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=75m2fMeJeqiFL9RjkDoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: KlDF1tEuqTWWZv3f9LmDcxaTJaiKDstc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070126

It's possible that at the time of resolving a reference to a remote
software node, the node we know exists is not yet registered as a full
firmware node. We currently return -ENOENT in this case but the same
error code is also returned in some other cases, like the reference
property with given name not existing in the property list of the local
software node.

It makes sense to let users know that we're dealing with an unregistered
software node so that they can defer probe - the situation is somewhat
similar to there existing a firmware node to which no device is bound
yet - which is valid grounds for probe deferral. To that end: use
-ENOTCONN to indicate the software node is "not connected".

Acked-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/property.c | 2 ++
 drivers/base/swnode.c   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 8d9a34be57fbf185e639c70cc4baae4510ba70ee..51394b7d44e31d0453e9c0084bb7ddb25b14a429 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -594,6 +594,8 @@ EXPORT_SYMBOL_GPL(fwnode_property_match_property_string);
  *	    %-ENOENT when the index is out of bounds, the index has an empty
  *		     reference or the property was not found
  *	    %-EINVAL on parse error
+ *	    %-ENOTCONN when the remote firmware node is a software node that
+ *		       has not been registered as a firmware node yet
  */
 int fwnode_property_get_reference_args(const struct fwnode_handle *fwnode,
 				       const char *prop, const char *nargs_prop,
diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 51320837f3a9f1bf4f65aa161d9b941affc74936..61e73417aee89feb855b0f429e112ca0af78a003 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -554,7 +554,7 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
 		return -EINVAL;
 
 	if (!refnode)
-		return -ENOENT;
+		return -ENOTCONN;
 
 	if (nargs_prop) {
 		error = fwnode_property_read_u32(refnode, nargs_prop, &nargs_prop_val);

-- 
2.47.3

