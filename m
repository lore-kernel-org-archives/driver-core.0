Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D70E45039
	for <driver-core@lists.linux.dev>; Thu,  2 Jul 2026 06:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782972527; cv=none; b=j/V15FJ72ZmO3Qz9tr/4wqf69MC21sI3HtPLRx7GKPu3Uf4kW2RrC5ub52Gnh2syxdhUFvCSPrKMkqYqindhdjA0G0Dd4NjGl7dLnUyr9ZD6CK2gZoIMQolWejYPWaTeLBN1eAYNJ48bexhAKGYPMnPQgX8LOqvhab1iItsU0fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782972527; c=relaxed/simple;
	bh=xIzMABhrBVOXS12KhXGxjbw3vGblyslZPLNQnrZtcYM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YypdLt+MGOjGOb0+ST7CZbanMSAL9tCztjEpgM/l3r0VDSU17m7WaPjwml90ikfljU9wNBlCRtBJSmJ5Sh2Lf8E0F0/9lH3nSo9UNpzUd3v6IDNcsKCTvubw980kPe0WlSd68KaCorhrM18Fa0Xh4UjlLOMMuAI7BQo8Yhqf1B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ni/umDJi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z0q8qqeD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ni/umDJi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z0q8qqeD"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621KQCb3067877
	for <driver-core@lists.linux.dev>; Thu, 2 Jul 2026 06:08:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7LHd9c1QICTgnfClv1h2ci
	DcQzquFOL+HXfQ434Enz0=; b=ni/umDJikvsXP2fL5p5CK9HmBCOcnzezaLQ2Ix
	7RF7AZ1yHiZXMy5MD+00KGaKX5jGodU5EqPGdv0jlGSagO6HQSwhSEozQxb8voUL
	cw1i6A38iHrJjvFN+Z0Pao9eiOjbkupEl48tCUYKimuFJIStf8VWhpxNrhg4iUK+
	608prt42LHzJR/RQQG/vQEIJ6fc1a+WPHoOM7E+K9qU01wKw6VuYeiKEKcq5P+Zx
	ZWKTYpNNA7n53tFtUt4M2xzSUifGN3vwjB+/8nD0nt2PZ5wsM+kn3YwwBS97H0O5
	nqMsGkeRtbh7z9QuvxvU+4W/DTSn8mkHKIQfN9TWkKGx72sQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f510am3q7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 02 Jul 2026 06:08:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c8e14ebb2aso5611325ad.0
        for <driver-core@lists.linux.dev>; Wed, 01 Jul 2026 23:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782972522; x=1783577322; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7LHd9c1QICTgnfClv1h2ciDcQzquFOL+HXfQ434Enz0=;
        b=Z0q8qqeDgT63dxOo+AUB9Hord/britOoJxkKD0ctbMLJ0YtxwWFEFic5pgYhl3KAYB
         E2fjqE37w9sjOa/+DM4frWYd2Idn/5AsWJtPpmrnMh3+knP7ZJ9nMDz2MYRw/c8fmI9s
         wGSwAOEcgazwwJCEJVWsOffIwWrCXfWTD15uWvbVrP8M3/N5gs10DSEJOsfeVEam6hGz
         7IfiB8BhM+cj5jXMjwcHI1gz1i2P5YoxTAfK0PjKIRUq2O9pTTiPO+G2D+msmy4QpqVQ
         IiIS23sE7eECoVjGtXoua4ul8x9mwEGIHYHyOrw4CxFlMpU2G76AXRVQW22q8ahEiBJ/
         Mylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782972522; x=1783577322;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7LHd9c1QICTgnfClv1h2ciDcQzquFOL+HXfQ434Enz0=;
        b=NDySDoe+RlSNS4VcSchQL0WcPkQow2wfIC81xQJ/s1RKl1eGzPWGbQLefnxgrky5xv
         buAWx2fZ/M2/sUSfwqMWPhRl56p4XaZgCKqXakbSCDBpFPdai0Ip668AcAjs1IAaMqHf
         Wm9LvLJgd+rg0om58H7Jx7hz0BFVpNfLyhkPyjmoLhfLXY98toXh8Op1KOwl38En2UhV
         LrBGrAROaGqUms4LYFG3KKTBLrUMLjVZuH429bimBnNAo5Mn4AQyLCrJwDUijlf0vltl
         IzhzWVwwg5/oHSCzmyNkXz489mepzqQ31S16+aTBbybt4rGxSm8DRsferwm61H2cy373
         WOHw==
X-Forwarded-Encrypted: i=1; AHgh+Rq7stbHMoFzGCC4N3cIPSN+axTE1ntPcR7vuA+Hn734Kdri8TE5OhkkTQ5ivweFVKOfkgz3IN5wi5If8w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwCyNxRA8UkQpiIZso7eZ/qlsJFLJgY4mzuu7f7BpbAa2R6TOwv
	BIi9r7evKZUv4uiKRnPJB+DWTNh96GzhQFTkLv8NRahKYucZuMMwGnB9VjSaui3ZmZ6M3u0Zr+d
	qTFEyNDmbut9Lv+9HN5C/TfaM4CFXs52odpstOBgW6kVyYmhPLHcHCUXJaxDU4K8WHw==
X-Gm-Gg: AfdE7ckbE2UBf4yKo4qafGW9/FDWYpGwP+TgSe6M966mt4cMaAnoOZBmoCg/LuQUVVy
	P71we9ASbJbQdjwmVQNT9CetiaMfWx8byPGX+9b+BRBLvCT3ILd7/dnvxw5qOQFm+wn50ftACr3
	JmQPaa31dLcwUGv8HIMYsLGjkX8HdzCt7u203UVRbapA81RIxvIg0UD6GLYkDo4VNsDXvpe0obW
	Zi26a5UilFThJPblVz7PGefHKE389Zm9WX1pptDkVjyg7xIHyaQd5PqQpCwrtkkvn9kp3nBF89a
	SwSXWyK+qOYIcJ/eBDEko+0EonBqSXd7eGMdTXa3/7zIK+8vtynCdmWh69vTTUFvQdmctFksAOQ
	1/0f3vfwqPpOL5gwwGUpM+LXyzIfjIAL9P86K+LHLiyC1
X-Received: by 2002:a17:902:f651:b0:2c9:c913:e214 with SMTP id d9443c01a7336-2ca44a1cdabmr75889355ad.20.1782972522461;
        Wed, 01 Jul 2026 23:08:42 -0700 (PDT)
X-Received: by 2002:a17:902:f651:b0:2c9:c913:e214 with SMTP id d9443c01a7336-2ca44a1cdabmr75889005ad.20.1782972521787;
        Wed, 01 Jul 2026 23:08:41 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9aa00970sm8176325ad.71.2026.07.01.23.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 23:08:41 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH 0/4] spi: fix sticky -EINVAL after PM runtime resume
 failure
Date: Thu, 02 Jul 2026 11:38:19 +0530
Message-Id: <20260702-fix_sticky_-einval_after_pm_runtime_api_failure-v1-0-6ddc317011c0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFMARmoC/yXNTQrCMBBA4auUWRuIoU3Rq4gMMZnoaBtDfopSe
 nejLr/NeytkSkwZjt0KiRbO/AwN+10H9mbClQS7ZlBSaanVIDy/MBe2jzcK4rCYCY0vlDDOmGo
 oPBOayOgNTzWR0ONhdNIMtncSWjUmaonf8XT+O9fLnWz5bmDbPnyJc2STAAAA
X-Change-ID: 20260625-fix_sticky_-einval_after_pm_runtime_api_failure-6797d0a5c4d0
To: Mark Brown <broonie@kernel.org>, Dilip Kota <dkota@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>, bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Douglas Anderson <dianders@chromium.org>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782972515; l=1503;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=xIzMABhrBVOXS12KhXGxjbw3vGblyslZPLNQnrZtcYM=;
 b=ywxqrVcRff5Xmtckb5XEgw+rGsMHvNYpd6paW5OAHepe0UfyIbHv/NeHi74nUfLY3pdC9uWgU
 9Dw3548w0aSB/xbmjvjovTzWw1Dtz9XBcmHTBFK9X5x278+d8NxNuuO
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: fCsFtJaXD11tkengGTUjrZu_NX1u97TF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA2MCBTYWx0ZWRfXyKDB1xIABRbC
 QD5T08IyjlnsBQTey6tTb2W8NaO0KovsUUldNAeZWPx6hkzJSTK3riKLdbCWDkE+VwFbtNsTTmG
 h7+/SGFEoNmV9oCoD3DXzo27k+HbdkeKyCQ5L26fiEciPD4G47dqGziNXIMYs4tHdQnHwirkBW1
 aUH2f/fnhLwCet0EeMFLR4BtROtrArveZWmrgyhavENrBOeGupq4d3E28I+Pkl22ZVBCeR84YBJ
 vCwM2sQ+zgEQ2FgGpcKzJWBgRwPBsjNUwO45UFH/vAn/Z/7Mn50HwvdGs8Nfsd2g+07q0TGQgfW
 CPS61aY+8a5+qpHbvLITxzoQ0Rl3WSqWF4kvDuRDUIwJLyGGYixuuGRVohePyQOZt1kQoGsHlef
 eogQ9Gx/nay+Kdr9nZVpDNpK8vUJ75ZzP+MsFJL2xobf7dIWWvy77gzI0PU1hTbKzgdZ6lnsuHz
 g7AWPOmK4k9EPkYAYjg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA2MCBTYWx0ZWRfXxTfP/+2Rb4kc
 ClPZ21yePE7LJPDNCIUMqG1xF9aF9ssCwoYPdX7PIMlUZ45C6FcDX1YpWryl/7J/0pNjSl+9o2K
 wCYUvvuwOt3rbQUMWORKcmuWjtgY8YA=
X-Authority-Analysis: v=2.4 cv=JpXBas4C c=1 sm=1 tr=0 ts=6a46006b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=E9aaBbxYo9AZKUvAECAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: fCsFtJaXD11tkengGTUjrZu_NX1u97TF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1011
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020060

When pm_runtime_get_sync() fails, the RPM core sets power.runtime_error,
causing every subsequent get call to return -EINVAL without attempting
the resume. This makes the controller permanently unusable until rebound,
requiring a driver rebind to recover.

Fixes the missing pm_runtime_set_suspended() calls in the SPI core and
the qcom-geni driver to clear runtime_error on failure, allowing the next
transfer to retry the resume.

Symptoms observed:
    spi_master spi2: Failed to power device: -110
    spi_master spi2: noqueue transfer failed
    geni_spi 988000.spi: Runtime PM usage count underflow!
    spi_master spi2: Failed to power device: -22
    spi_master spi2: noqueue transfer failed

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
Praveen Talari (4):
      PM: runtime: Clear runtime_error on supplier after failed get_sync
      spi: core: fix sticky -EINVAL after pm_runtime_get_sync() failure
      spi: qcom-geni: Fix missing error check on pm_runtime_get_sync()
      spi: qcom-geni: fix sticky -EINVAL after PM runtime resume failure

 drivers/base/power/runtime.c |  1 +
 drivers/spi/spi-geni-qcom.c  | 18 +++++++++++-------
 drivers/spi/spi.c            |  3 +++
 3 files changed, 15 insertions(+), 7 deletions(-)
---
base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
change-id: 20260625-fix_sticky_-einval_after_pm_runtime_api_failure-6797d0a5c4d0

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>

