Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3896844A40F
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786455469; cv=none; b=rU2FXwLEFdQ2bp4CCuOp9kc+hlU3367bg7jcd32TTgh4+vtybyjuS+BlfO1ZxEi/V12uxwlofii2uDxCQxiq0oTfPcaSn6hDRbuMMg9MX4FN2pgo3pHdiruxRC2iZumozfmvJHPA3apnsiZcR/Es8slLLs5H1jXWNvFaPexhx2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786455469; c=relaxed/simple;
	bh=BqtVh29iA/EPyooGaO2p0jd75Kq96yWmIc16Fu8hTJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zn+XRtNUJFBamBHFocj5BD6RTScdD+ngWfPYFFndNuWwueOkCgR30WIqp/p9UeDf6gLX2uUIfaE9K6+scJbGsylKP1SX4cDJeNsN7dXuRt1v8AYD9t1tySbEkwGxUHnHLQPSfx4ure7LU8jifPZkxPleat4TqeyaRSXQV7rUOCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aPHwx4TN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bFQip7/3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aPHwx4TN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bFQip7/3"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWXui409850
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:37:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D/utWiq2ARW+ai2bHcmXpD8j3glUx9uY48Adn0v5qM4=; b=aPHwx4TN/9Ocqb9p
	wUvxUinIJWSnN6LTqjbovhGfIremLbEOj+Jcf8X5JZwBgvsFy51O5FZwvfJo6jXo
	bwTCd7DpcxVRJO2i9xEtJlyOh5UPeDoUfRHOSaV4pdNYc2zh3B7dtmLxH4K3QPb2
	8W/w9JHjpMxPT+Lms+tAmsJL1/jxaCQI45fI/NsR9j6gfrygq62wJwfNRAEt+eNC
	0p8gy1pPzmFU1vu86u2WksPwa+JygP2fJ06/HVNSFRfrg8YLDIDklMNYNp6ubrNp
	M07QADMAlaUPNKGW0QcYLqQ1PmqQVCk6JrYKPnT8nShaO0Wvq0rwKr4Uq3Q0XPGC
	ozWM0A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyvcra25e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:37:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f0fe57470so997279a91.0
        for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 06:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786455451; x=1787060251; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D/utWiq2ARW+ai2bHcmXpD8j3glUx9uY48Adn0v5qM4=;
        b=bFQip7/3/0hnSFMdvuxdaIjbKx06asCD7J9nwoCSEltquviGoo0xwYMIxtzMUtkBpA
         RsBonCF89N5ykRczzllNaQOxkixFtehScrBM5FGLh2DFzS0nEJrd2qJRS8ySJ4ZXDXvj
         hj1su7fEEMI9FZ81sBB9PnSJN6K86NrgcvBnEtTh41ePqveDqxzPp0doJeP78i6zprMi
         CMFGtNtzDSJga5lE1wERlKol35KklnGEA0OQA0f2Qbe6d9sCs/Eikv2qVfKiwAKQyJAd
         WleOQS9yLoMv4+TABJ6QimSIoh6T6C1UlHtt2B4pLQmdNZo13EYDV2QLY08KIXL1mjlu
         2p7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786455451; x=1787060251;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D/utWiq2ARW+ai2bHcmXpD8j3glUx9uY48Adn0v5qM4=;
        b=lLWEyPSSrSMNmYjECxDweVS4p8q6iyOBkLbpPm4ZI3Nz6hP1DqzS2MAlDQGavt/I2Y
         Ee/VplCBwSL3xIiax4erSoThPs+5GI588K+cNs2yAh1zqxSeFj/uCdC95O/ReJhHDEAo
         STtooF5cMpUMqeA9GNhelIXnwYNuhhUJ9YEqOGMe9UCylHOhqhhzGtdE95dTHoNFDIxO
         w2gPEGEAYHoo9taW5BZOqabRMkY0g+tD/Z6GgLWjtbGUy4cZzLwEm9bgNq8d+2pDamtm
         6OTmbaAsaRl1SgzrG91XkfnoyD7FizfUMTNvPjqg4hy6e9hrV0hABAYFV7s/jYfVzj9p
         Ncig==
X-Forwarded-Encrypted: i=1; AHgh+Rr19wvSCNPHPp1ZKPaYFzeUOJTNFsNHLu/xiyjIWbJ54VWuUrrNZBqEYSuPpiC6tLpx+pDFLibVYEtOIw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyGKmQVxfjTFcjkxdXTS3M0uwWzMkCFNKz4luztMbLPscBxGIaY
	Z9MtygSOae6al8VzMYuj5qkQLzSV77uOBMcZto9yJ++0eE1WSSLwBO2jFUq/zG8RaJ/naoXGJiZ
	rEmkHR9J6sUQkyMU672+HSrWIlDV2zK2LefUKcgZTVHNJSsxBmzQI1PFp77xsznF4VQ==
X-Gm-Gg: AR+sD12ef36zgiv9GTZD+h+Ob/0Ck7xxN27POKo7MojWwRV4JI8BcsXHmTQHJPYAGwk
	8fIuA1WDxqCeeHeW29Cpafq/BiCWbIArs9qoHyLmeKh1Iy9dVlqXhg6R1Czjl/gN2KBaCN+MLAx
	dJHt2DdH4wmiubmE50XC9FIXqm2xIluIvFSF/jDI/Pt3t47NznY8jRqrUQUMGEKkPrXbi99ZBKH
	RuLavMY/f1fv7fWuIzVBPdD2NKUtNE4cnkOWdIhHqnZBp0UOmg/SHZxD6zNF905TXP2ivhks1DC
	LvxQ7/4ptP8olZUBUkAsInAkIjKJATQKS4VB2J4WG/UlQnhCVyx6tTTwl/xebn0L3Ph7TQ/hdNE
	ERDi5Hgp7bZwRm7EtZWY8Dfwpu+0NXhNCxFy+/AFb4z5RiGY8O2B5sGFs
X-Received: by 2002:a17:902:ccc9:b0:2c9:e846:a589 with SMTP id d9443c01a7336-2d32da94a37mr908505ad.13.1786455450891;
        Tue, 11 Aug 2026 06:37:30 -0700 (PDT)
X-Received: by 2002:a17:902:ccc9:b0:2c9:e846:a589 with SMTP id d9443c01a7336-2d32da94a37mr908075ad.13.1786455450356;
        Tue, 11 Aug 2026 06:37:30 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f4819dsm8360885ad.37.2026.08.11.06.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 06:37:30 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 21:30:41 +0800
Subject: [PATCH RFC 12/15] arm_mpam: Fix get_cpumask_from_cache() to clear
 mask on error
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-mpam-resctrl-dt-knp-support-v1-12-ea6397bead59@oss.qualcomm.com>
References: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
In-Reply-To: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Conor Dooley <conor+dt@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, ganapatrao.kulkarni@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, devicetree@vger.kernel.org,
        driver-core@lists.linux.dev,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786455328; l=1277;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=BqtVh29iA/EPyooGaO2p0jd75Kq96yWmIc16Fu8hTJc=;
 b=nCUjHi/w+wyvmUPfAJxF7oK5CzUc/Ibx4DR6Smu7voNpfIckaSazwIbHZe1dexxBOsrONZqg8
 462WF/100brCxPIzrTaFHv2GKdyzfFPcc0Azu5wbBLoI6nobQPkOm5L
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfXyjvM6gb0SQ1S
 akQIQgQ40CJepRnqfn5z7FSn8p0PTgbt//fQulbHV2k6heco9C634aiWlJ5a8Jgbw7wf586q7Nh
 ZROwprHB870OT6dbbGK5WDyNl6/DZUXmEUVriniJZNiM2nVpSAoXG0ZwwtqIxhjsXIZwEdmrOA/
 KRhd/8CHm2AxPhA8rvYmvQN44cbRY81tTmKCYS8ZZZ7+qHUDqw75FvTk2t4BlM8412spu9C4qww
 YTtxkHNTA+OGoL71y4nURCUlqsdsmLu7QU/pO6owJ1f8KrZgIjIf1pXWsjdacZKWM44ZufRyrrb
 jiYuPrsZQgiw1of9grhEJ32jXQlgD2k7Ys6MlSCRARaCe9geJLTNINU9kJKMmrs0RrZ3TdpL4HH
 ViXDJDlPQg1XJ+KAPGUUMBoxGvRBGXok7KmhjdYcqOA9wZsrL4tEBNNW7v+axtrvz/yMPMZFlG4
 W70grd7YlZ0vjjGTKMA==
X-Authority-Analysis: v=2.4 cv=e/A2j6p/ c=1 sm=1 tr=0 ts=6a7b259b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=rjHAeU6eiAh5UonRzJYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: DJxKxwVb_DtPHGDsJ1TscuzBw5j9O0Vz
X-Proofpoint-ORIG-GUID: DJxKxwVb_DtPHGDsJ1TscuzBw5j9O0Vz
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfX5csUb7za4m2z
 RPH/npfEcMbMGWmlvnv4oztC1rNigcbFK8g8/gmh567jmnzWQX0qnRaHZEEdZuGBXnKUJvB0z5j
 llnRKS4TTCtgJzbBmkJqJXF4uYiiF4k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110114

If mpam_get_cpumask_from_cache_id() fails, the affinity mask may have
been partially filled before the error occurred. The caller has no way
to distinguish a partial mask from a valid one, so it may misuse the
incomplete result.

Clear the affinity mask before returning the error so the caller always
receives either a fully valid mask or an empty one.

Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index eac3bc695fd1..d8856864e89a 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -243,7 +243,12 @@ static int get_cpumask_from_cache(struct device_node *cache,
 		return -ENOENT;
 	}
 
-	return mpam_get_cpumask_from_cache_id(cache_id, cache_level, affinity);
+	err = mpam_get_cpumask_from_cache_id(cache_id, cache_level, affinity);
+	if (err)
+		/* Don't leave a partially-filled mask for the caller to misuse */
+		cpumask_clear(affinity);
+
+	return err;
 }
 
 static int mpam_dt_count_msc(void)

-- 
2.34.1

