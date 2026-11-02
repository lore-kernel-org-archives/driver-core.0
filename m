Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614977;
	b=Eztx7YWbH3DiSXz4BwBernFVSlrTU1oVaYP9I5qMdYOsgrll38bcWpvE9Bg4jUtYPRZ2
	 RKOr9HJMHzcXFCzyAixTrvzCFCqNjXh4IWditcyxgtg4D/xxnUvqnS9yDJ5uABhup0PX/
	 IHw5vxXmWR2HjIQwDHNWj7xU9ljA/xpHVM6L9TetabIbT7wJAcdYt26K6+Tcn6fshFFTg
	 k192/UHMIVkLJqWUMBYE/9DJpiXabwPSt8gqRNHjxCjKA/Xg3FxGkJm4QSRCKIInOVf1p
	 5wD+IFiAbNwE/kmf4n3qjbCsI0A5hTgepiOSi6WtePY8rQXDYzawrUfmPeGeqQw5tQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614977;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=txDbIO54teYjP545chfzMHa6XzfSozkBD5T780zcYFc=;
	b=uqd8O9z0MOzy6z1nzGmUBLD+mjgAyaP2Cl/a/649UNLc1gThw6wpWjkMZVtcs4hKp63U
	 1n5OLsGHn04TGoaejFI8ODhk8BdRcGT6cPznTML2uoYy+ALjEMR1C388Q4C/8REwKPB9R
	 B/KNt82ZgtXSLUxgJp6sBDAGBbvoPm8TuPHJIJyISXJiZWWyXxpfJtpp/QR1aT7HEqU2B
	 MMtolUWC5x3HyIRLtcn+QDo9siRP3EBEQhgo8Tli9MqVB3uEl7PJS/vCZrHohjzYZViaz
	 gtOTImmLWA1finq4Gc0Q7dy5WhGP5v7YzTbPLn5HcMXwUy7M4Ntm2Pl5bhr76DF+eKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rh5UgEZM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fgr0L6QG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53595606A326
	for <driver-core@lists.linux.dev>; Mon,  2 Nov 2026 10:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53595606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rh5UgEZM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fgr0L6QG
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A3lI260570
	for <driver-core@lists.linux.dev>; Mon, 2 Nov 2026 10:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=txDbIO54teYjP545chfzMH
	a6XzfSozkBD5T780zcYFc=; b=Rh5UgEZMSgEk4sQjOAyY5jW2wQLhpfttW7zir/
	TKyfSxvjo1qLVDFNDjKnPXk7E7cRFpnoZOjNzhdRQLgtwTXEGVulBjDMRw1a7Ydx
	8JHyYi5CtPSCk+P5uKce6xJdjMnRhxsg0rK1+CKNLi0BWNvtNEjkAp6i7d5Cwfix
	o++e5cNlGdncbfsc74z7sGnQknjOIYLT8XAUcUPm7tHaBziq5r/rc1DT22Nd4cbl
	rDoAEdYdjsQq4+ZBYu0OsztO89/h4eQF6zhGZ8L0Nhv/sVWKrl39AZK1ICZS6Xts
	2q2qvK8RrFBNJITqaScMmC/TUb0YTJQZHfnqI5dWeCFVnWrA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvra5v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 02 Nov 2026 10:22:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f33438950so547635185a.1
        for <driver-core@lists.linux.dev>; Mon, 02 Nov 2026 02:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793614974; x=1794219774; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=txDbIO54teYjP545chfzMHa6XzfSozkBD5T780zcYFc=;
        b=fgr0L6QGRE5EKD00nKpsXb+GZzSOMi+7J6C/0MGuAxOj7DI1pet/RVAl/tQ3jKDRS5
         zOzeEo+HJvnnryY4EHL80e6wKIgVgFklxcUXRXd9DnoNWU4fBYlsSFozPGIByZxaPGXy
         iEaIzbhHbvEy7k6eCNBuuKUeiVEteuqjeDMMga5ETKV/nUXtglHqQzdAO2roNCYjX4RE
         hswwFcJSlB+2aHHgDPO3kfEJBk1bG+bbpb9zvPIe90dTYu9V8ZvbJ5e6XIN2xHx1hvoA
         QlcsfWteYqLNe9QbU5OCHFX7Iemhim6InBc/pwVNcgY7gAO/obSAPu+mJDOBp2CmmBUe
         4iuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793614974; x=1794219774;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=txDbIO54teYjP545chfzMHa6XzfSozkBD5T780zcYFc=;
        b=pl2ZSM8JFXZmkRLD/vv64Jr8GQdcXRcEyzHd5xezknU78AFkBtvWeRV3o5DrBCY21V
         QNVFnvP72YWeXMkxwfR6WdJWXS768Ms1cmyGuzwFJA31vnz8R8fE+Ef4V4ih/nuo9cG8
         5JGdtvtt20EOvxvC1IHogEC1Uy8u2CJYO5CVjOoxfYPCbVbqM95jZoFUR/Eq9+Nzw7RV
         N4H7WDe2gzptqBt+ZmgBhrETIHWZmM2HQjvdPjHeV/e4FmbOoBSBW5dJjwMa6zmA8wOK
         vV27X4s37gdiaUmFMR4Ie1Jz+iQv0swkMiIs9jFSBix61ZleOv+DzemptOJmECdgYarj
         HyLg==
X-Forwarded-Encrypted: i=1; AKwUvBw7pbGSeh6Nfjmf0/JHh5XZZxndnJWq+ryHzN6OHxacEdUzbMhosGGgiQOln35zbO3F94WY3jZQM8HjOg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJy8kiKcSZtzq64IlTgPMmAjgyC5qYeiDEhzg0ypoEwJoUA/vBf
	MAgV6mIF1sPfIn2OZ0kY6Ib0wiOZxP42gfAkyoH7ETFBojlcoOH3MrHUhQyI7mvtQ9ZPKJ9fMl5
	f+bP3AjBECF/W8K+gxpes3B+F+0ezt+nJ7ivAWuZuG/gCNoBdRyxSxpBcDfiU0f+CtvhEHiYnFX
	sS
X-Gm-Gg: AYBFou1EOwJfENz+luu60h+7dpDNn8QIcwRf87VN6zR9Fh0Sv/d61LwrAJmc1CyD5VI
	83Lv4Q1Nf5/ta5ms7C7ljMBS0lWMzS2nVArDulLHc6KShfOk8P0qap0am2UeRaAv1wAog9zg5a+
	pWXF1p1+o+M+gmAJypwYkB0UglsIjgTI+RC0dgcrBICcqaFFy+eYUaUNwJO663vAsygG+z5K7S/
	ywKCHaOaoJ4ajzJUMOJCOYjXlT2Ah+23dL/E8CC36RhhGN7ISkFn1BMJYL7t52K2bnqfpjPUcJi
	9wNSfd0XfhM85FqIfFfDdLMI919a82R95/eOccKY1AiEgLpH2Uodp7+RPyLlO0StrYScocl7+68
	bpNoKvjZDwRDYQ+np9iymUl3UdIS1VrDWsLjACOTMEU/G08/t/tYMD+nK7g==
X-Received: by 2002:a05:620a:618b:b0:940:f224:5a6f with SMTP id af79cd13be357-944217f708dmr1465446585a.71.1793614974145;
        Mon, 02 Nov 2026 02:22:54 -0800 (PST)
X-Received: by 2002:a05:620a:618b:b0:940:f224:5a6f with SMTP id af79cd13be357-944217f708dmr1465442985a.71.1793614973456;
        Mon, 02 Nov 2026 02:22:53 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac09fadb75sm173842435e9.3.2026.11.02.02.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:22:52 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 12:22:46 +0200
Subject: [PATCH] PM: clk: Report clock enable failures from pm_clk_resume()
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
Message-Id: <20261102-pm-clk-resume-report-errors-v1-1-ba6e1dddd522@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHVk6GoC/yXMyw6CMBBG4Vchs3YSqMHbqxgXtv3VUaHNDBgSw
 rtTdXXybc5MBhUYnaqZFB8xSX1Bs6koPK79HSyxmFztdk3tjpw7Du8XK2zsUJKTDgzVpMa+je3
 2AO/2EVQOWXGT6Xc/X/620T8Rhu+SlmUFIC3Fy38AAAA=
X-Change-ID: 20261029-pm-clk-resume-report-errors-b5d538eb27de
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-pm@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5326;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=O6jdgaz4i2fF6JPagpblmH1Np8pousIfoqISKdES3ig=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6GR3vaYybZlkrv8eUtlbCmriJPb95Yo9hb8bi
 PkHhpNjOEeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauhkdwAKCRAbX0TJAJUV
 VvOuD/4/jla2bm6PSOFoZFTRMTPZKjZ6f3aB4beD7rUY0bnNTG37utoeuEGrHB/Ot7cAbFthPMo
 oxUElf7OrbkLo5v6gFJJJIv3OeiK2fPlAswO2gISVk5DkB9nbB2Shs9/4cLTGXO1dpATp5wm8Sv
 sw65ciO78L8IacsyDCfs6ame/ZvarKsgSoXt+WJI45IodzJXB1aPT5JwAb0OUjdV9Ijjl1yts2W
 nY63YIorEOJogradD2orGgxWc/UmMynrNFXmQGYDlpCPBK9R9SJtElHURMlvpBZTbftJDz9eMEK
 kioMMNqC+n98zmhiTk157yQP078xuIq54lbXB3x5uOGIBGcfoJiNLfZ+/ipWn8gWzNblgaf0XL9
 PWw4pZoUDUg32cs4Oq0GXhX4+CyPERwDy6a1VL8eRA1XcgyKFV5FTgFeTjS5xqOWGxR6mBYjkbT
 /h9H9zVe0ni8vurEi4BQnmezFs64SgK5Ayq0DpH3YRaBvZLDg91CO3IVvXw0Ae2Y3pIOvQ1AI1p
 WhyVVOi/gdtiF4fR/gBJn0S0gAcq99K5jIRUTVazc8eCQB0Zr6dUZPCWqt0kDuUr5wOPFO8/Pq3
 UYraE2/dhly98+w2+LAjSZa3S918Eo2wbqcupqxn5KOH3yeXtW/H23z4IX5oHyrGLJRjZfAQqmO
 l+CNG+LDzz8+JXw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae8647f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=_2T3vPzLGwBzaavU8JcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 53HHWk4KqdVcxN9PLudpbB8asoyOuR4l
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfXxE2GjnMS38Ae
 jdqtpvgvTeOBb5oczsG6yEbZLJUIIyCQeCqvvymvl55qJrybDx6vM5El1GLlKurNvTzhLe8tmG5
 cnCmnhU36jXZirfIoOQuSkAmTDKeAmc=
X-Proofpoint-ORIG-GUID: 53HHWk4KqdVcxN9PLudpbB8asoyOuR4l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfX98jng/2ruMgf
 8FVzH5bwwaBH1tDPbC6qoEbALJ6HM8dCgECYvI6vZWqHo2+7ESduuE0e/G2G/9e+ygfnWsm6lW/
 EXmQa9vhqJA+WWeR748WuujaxakQNLydoY+ZgYHwHQXCARx9Ub2PFZdC5dCWlVEX1CChrtOB+UR
 fCnis1DhBLY9lPaIzRmsgDq5z124GdTjqiUwcG0S/5ZN3MXQsIr+KOgPOImx64aIY0j1W+Z/nVd
 8SowOfisyNbAR1QUf/M3dC3+geadgvVrM4vbrA/fd1NEUJcQ9Y29oPQDzuLdSyS+wDtf4OTKl3S
 wnYBmZYPVoVTYMUtodTLvvOf3S0SJSgtswxAikAYW67SbdfxBDZgayGW5xjWaBvBoMuWT+1pvIF
 VyJeU4jyLYrijlvHDVM7ftqE5/Olipnm+GX1YbTeq2kn7RTTSyKbNeMWJT6ErTVGhQQCVsfe210
 HCuaUh5Kv+3AUfe9njw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020041

pm_clk_resume() logs a clock that fails to start but always returns
success, so the runtime resume of a device using the PM clock helpers
succeeds without its clocks, and its driver goes on and accesses the
hardware.

This happens to the devices in the Qualcomm LPASS, whose clocks are
provided by the ADSP: after the ADSP is gone, like right after a
hibernation image is restored, a sound card opened by user space
resumes the LPASS LPI pin controller without clocks, and the access to
its registers then brings the whole machine down:

  qcom-prm gprsvc:service:2:2: CMD timeout for [100100f] opcode
  qcom-sm8550-lpass-lpi-pinctrl 6e80000.pinctrl: __pm_clk_enable: failed to enable clk 00000000b90a5151, error -110

Stop at the first clock that fails to start, stop the ones started
before it, and return the error, so that the resume fails and the
device stays suspended with its clocks off.

The callers of pm_clk_resume() check what it returns, including genpd
and pm_clk_runtime_resume(), except the MMP2 audio clock controller,
which keeps ignoring it. A device with a clock that fails to start no
longer resumes though, even if it used to work without that clock.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
pm_clk_resume() always returns success, even when a clock fails to
start, so a device using the PM clock helpers resumes without its clocks
and its driver goes on accessing the hardware.

I hit this on the Qualcomm Hamoa CRD while working on hibernation: the LPASS
devices get their clocks from the ADSP, and when the ADSP is gone, like
right after a hibernation image is restored, a sound card opened by user
space resumes the LPASS LPI pin controller without clocks and the whole
machine resets on the first register access. With this patch, the
resume fails, the open fails, and the machine stays up until the ADSP is
restarted.

The LPASS macro drivers already check what pm_clk_resume() returns, but
never saw an error so far.

Prepared with help from an LLM-based assistant.
---
 drivers/base/power/clock_ops.c | 56 ++++++++++++++++++++++++++++++------------
 1 file changed, 40 insertions(+), 16 deletions(-)

diff --git a/drivers/base/power/clock_ops.c b/drivers/base/power/clock_ops.c
index 3b8ba27802a8..a978eb3d5479 100644
--- a/drivers/base/power/clock_ops.c
+++ b/drivers/base/power/clock_ops.c
@@ -143,8 +143,10 @@ static void pm_clk_op_unlock(struct pm_subsys_data *psd, unsigned long *flags)
  * __pm_clk_enable - Enable a clock, reporting any errors
  * @dev: The device for the given clock
  * @ce: PM clock entry corresponding to the clock.
+ *
+ * Return: 0 on success or the error from enabling the clock.
  */
-static inline void __pm_clk_enable(struct device *dev, struct pm_clock_entry *ce)
+static inline int __pm_clk_enable(struct device *dev, struct pm_clock_entry *ce)
 {
 	int ret;
 
@@ -156,13 +158,29 @@ static inline void __pm_clk_enable(struct device *dev, struct pm_clock_entry *ce
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
+	return ret;
+}
+
+static inline void __pm_clk_disable(struct pm_clock_entry *ce)
+{
+	if (ce->status != PCE_STATUS_ENABLED)
+		return;
+
+	if (ce->enabled_when_prepared) {
+		clk_disable_unprepare(ce->clk);
+		ce->status = PCE_STATUS_ACQUIRED;
+	} else {
+		clk_disable(ce->clk);
+		ce->status = PCE_STATUS_PREPARED;
+	}
 }
 
 /**
@@ -483,17 +501,8 @@ int pm_clk_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
-	list_for_each_entry_reverse(ce, &psd->clock_list, node) {
-		if (ce->status == PCE_STATUS_ENABLED) {
-			if (ce->enabled_when_prepared) {
-				clk_disable_unprepare(ce->clk);
-				ce->status = PCE_STATUS_ACQUIRED;
-			} else {
-				clk_disable(ce->clk);
-				ce->status = PCE_STATUS_PREPARED;
-			}
-		}
-	}
+	list_for_each_entry_reverse(ce, &psd->clock_list, node)
+		__pm_clk_disable(ce);
 
 	pm_clk_op_unlock(psd, &flags);
 
@@ -504,6 +513,9 @@ EXPORT_SYMBOL_GPL(pm_clk_suspend);
 /**
  * pm_clk_resume - Enable clocks in a device's PM clock list.
  * @dev: Device to enable the clocks for.
+ *
+ * Return: 0 on success or a negative error code. If a clock fails to start,
+ * the clocks started before it are stopped again.
  */
 int pm_clk_resume(struct device *dev)
 {
@@ -521,12 +533,24 @@ int pm_clk_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	list_for_each_entry(ce, &psd->clock_list, node)
-		__pm_clk_enable(dev, ce);
+	list_for_each_entry(ce, &psd->clock_list, node) {
+		ret = __pm_clk_enable(dev, ce);
+		if (ret)
+			break;
+	}
+
+	/*
+	 * A device whose clocks are not running cannot be accessed. Do not
+	 * pretend it resumed, and leave its clocks off as it stays suspended.
+	 */
+	if (ret) {
+		list_for_each_entry_continue_reverse(ce, &psd->clock_list, node)
+			__pm_clk_disable(ce);
+	}
 
 	pm_clk_op_unlock(psd, &flags);
 
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(pm_clk_resume);
 

---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
change-id: 20261029-pm-clk-resume-report-errors-b5d538eb27de

Best regards,
--  

Abel

