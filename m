Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584842;
	b=cjdtcsOluS3dmSvttTbBwlrtdGlAnCdYtw6tCT2ALYd+gCL6tEo7vjFZ4itZPLZZSzqH
	 3sw9WMzH3HgwDVSrR+aoW+SwCSKDzC2YtxLJqe97V6/LKsPMB0+wCnkks9anViJ7GK2YK
	 86y50IxXHW+7eZke6Hr3ENqka/GEnyHJ2WMDMHjiYEhhmIkOUZyd7iVbWETDOkoND4qtK
	 2Oc5U3cLsfLHbvTZQsirinLkemlMN7kmKduJxAfaC7nhxjIYvNUib/2GiUsEHrwQTA3wH
	 kW/DOEX2Me8fV+Jf4NNKrwpNMlhbidPiEWbz3Y1FO1/S/RGMCdZTk4oCXr0ljAU/AOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584842;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=itd8Y+uchN2HJrYq4RSPlfZt/iDxc9zWsOFSO8a/jcY=;
	b=P003eLaexldg+xBaDNgEU+UX+wMOEwg6KYSpyOadYTX592nbhSDeHkc/J7Fs0n7d9miE
	 Hxxgb0ddVMHotl3o7XQxynHTW90Kgm419LzzPimMwQp5VO8G7bzauUDFEXGzAgUGoLGw4
	 nLsMrIvew9vBNKa+0IHpxOyomGglqfWZc8wyreIlfyCOZpsbkGFPWBvfv0qN9/FtSoJoA
	 vmmKx9eWerXMfbVgjsDinXkDPHHPqAcYe3A4dwOvMVecuM67C1DplCoQZbNLfMrWF74Xz
	 C3xCN7lEL7eawDuS04wlm2L44+2qpcg6qKV9UpoRoOW6vS64pN7NFg5s0KtEtNFnhag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nJiKbz63;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b4iSLDvQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8807A60A3812
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 15:47:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8807A60A3812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nJiKbz63;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b4iSLDvQ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR72k1011736
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 15:47:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	itd8Y+uchN2HJrYq4RSPlfZt/iDxc9zWsOFSO8a/jcY=; b=nJiKbz63nrH7eqQz
	wdXMpjuGEjlhZ7hbYqQRb39wOMYLeEqaIKz/Jmcbzx6gRZd3xIw39AixOvbvDExY
	oHQ5gTXF93dXWfNR7BcBvgHNLn9md3TySS4Ou1gEvQTPV/DSKRPeuUZviXc9jTo3
	dXM8WGB63B/wdzzsS78gHb2E+AIHyW33DGH9oY7HsprE+K0+20hYo7YsdsVzunhg
	qckwvl0PHFhT+x7dlgfAKv34WIh3Qdm0bnYR6Wcch6Jm0rtJoIO+TsA1RN4niVOt
	HTGW4uPnanjaY3PwqJ6sixJzmJHY2B8R0ALcC0pOB3cBSWhYCP5ReNBr6nzaVT9b
	0S0wWg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkfdkud5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 15:47:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f559420f3so122852285a.0
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 07:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794584841; x=1795189641; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=itd8Y+uchN2HJrYq4RSPlfZt/iDxc9zWsOFSO8a/jcY=;
        b=b4iSLDvQR1ffe/yvedaAA9bT51cYfkVW2gASikgxn3woRpenN+rjLnk8fUMS2njxFr
         k94Y8AH6IxmxQUCCxYDtHF6dEVG8oCy81EeR3cbPqHTLwZvc44UyYbAXE3KDKqt9q6cF
         mE2IOuGU7PQI2spg8HlVoEd5oTf10LwSAkitF4/qHi+UvwgkIEPPV8JmcLp4SLOBelfX
         DOI5Qc/Nig+d0pINsti+BH8zjzavcMGJdhrNr3Yx/CvdPKHVsRcmIjxt3dVaCLpNeI1t
         xjBNSQ2Nk/ejObRxTqcKRPZ2gBszB5vbuG1fXoAu9Vq7DnNZFTcZphD9S2H3Fq8dGzGL
         mdQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584841; x=1795189641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=itd8Y+uchN2HJrYq4RSPlfZt/iDxc9zWsOFSO8a/jcY=;
        b=aA0uS1moZof3sMmrfkL40JT5xFIDOm7Ru8XN0I6FKEnlmaJlh7C1vAzORVS/GgSIUU
         yZTJxJxFsgY1w2U+G+9ul+QqOvUXBLUENpRfyqqyWkUTjVhLJbyo4Pa6kASvYwefK3v7
         sjxbxOhKnYBaTwk4dh1F+5Sqcn1gh5rhbnQyCLKoXW5p86T2veGYXUzI70/vbcfCdk8v
         u1vea2Ee+raBv1+wnopd7jQjIh8DtZUBq61dZgDE9yhU1NxzYujISHqZWAm35KVpnEgv
         ZZVqjk3F+Zns/G1wAtoc5HOGDu5gxnRmf+1WeeGVyatEFmQBCDImMuVXVMY1vUayMUoD
         pmkg==
X-Forwarded-Encrypted: i=1; AL+hErHF4R3yT5cIT7hnxQBIZrmDFZ+ve6oRMlh5XgkBYzLNxxdbxFYP132YAoUAg7jjFpqkssWS+0c3XEBruw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+OFv99V6Eq2jt1vNIIEyJodOJah4RIJuJYB73iQfPc6U6oWXPr
	SyIMHMULQbj8xiHvkwY1hSK6SA5K3r8EImRLtmz++rQY/p3j+GIodMNdwzGSAZPPznRJ70+lC4U
	6j5yEcSTv01xSfD3WK6IVeGLuSBU6tGSinMNwlqF/TqvIFyDTuXFnbR2pMyoEgdWwNg==
X-Gm-Gg: AYBFou38cFaWEb5WmEffbc8W7RnUEeTggrd7sZDysfiNrNPSKP/StruXo4BgvdOclNR
	4leR7DnJpOd60tY2ylhLzsXJMTvFeDO5rKrZm65aDlQ6y8V/xCrsZYtQCNLIYun+ZJdWioCEOjS
	h+s2Ws86K4ayltfIBlqixu61elKWiOqy83FLuPNR7Q+WiXA2zxB9+uy3cfDOcm1ZmoE56XzoP6e
	lMYBrK/ZPsDOt4wYvncCQzWTEGF2tDfPLD0rkOtYwdJ/3nUno4uIP4NTyMevxMDBzF7cd+hH01i
	Rampou8QqQIN6OQyzNw/FUfKYzE1/Za3CoNSu6+EkLzW/GsOaRHnzcaM7aKluRiqx8gBg2EcLx/
	IroltRg/9VeEY0TVRs8s5MlE522Dzk8GlCqk9yu5EocSoSLtvbv6rQudwnrKe4FVISoB9MZo4NW
	pjfA==
X-Received: by 2002:a05:620a:6f92:10b0:949:5a71:8b5b with SMTP id af79cd13be357-9495a718d67mr138856185a.29.1794584840504;
        Fri, 13 Nov 2026 07:47:20 -0800 (PST)
X-Received: by 2002:a05:620a:6f92:10b0:949:5a71:8b5b with SMTP id af79cd13be357-9495a718d67mr138850585a.29.1794584839734;
        Fri, 13 Nov 2026 07:47:19 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm5636519f8f.21.2026.11.13.07.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:47:18 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:47:06 +0100
Subject: [PATCH v2 06/10] fwnode: define the count_references() fwnode
 operation
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
Message-Id: <20261113-fwnode-for-each-prop-v2-6-4edc23d5cf50@oss.qualcomm.com>
References: <20261113-fwnode-for-each-prop-v2-0-4edc23d5cf50@oss.qualcomm.com>
In-Reply-To: <20261113-fwnode-for-each-prop-v2-0-4edc23d5cf50@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>,
        Len Brown <lenb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1638;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=uLLErtVyyBCCkNg/MASZUF+mZGiOHH8LUrLC/RKjXs4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9zD32k2a7eEkOl8aZQKi19IGoZf5y7QX/pyld
 I9O91GNOyeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavcw9wAKCRAFnS7L/zaE
 w2nLD/9yKd7FFWn2nO+v8p2f3Abfl4909ZN/0SbSIbO8rtsz2EQaIYF6bnYIaUircw3bP3KYmX5
 g9eATzci7IIF5Z+uE/xGl13aNmKk96nVRhqoDLyc2JHfnUHo0hzTtNZKYDcY4ChonfmQAKrwYrg
 ldnnuLTn08xgUzcgFe8yWa8vfpbsHWp6uiOfjvsx3pPaIXdIIb9c4QxEYa2cyB0Uo+5GeUlWQbT
 XRkFqxQRU47PbujSH1F587xSWtQd4Gg82Nk8HCYzHNI2+Yn9ZgjuHi92QCJNkrypjtUUfeohopx
 VB7TFLXGNRomzEJ8gOmx9ij8b3UBBeayg3YFcfDxqM7onoemn8L6rUM4DOHzw17CiKEe/xAdUYu
 fgCMxpyvqVCWPkUs1sSL55PFsKBZ6/WMx6XDdpcmYUAWEpsNUfNtxw3BWoXh8ItVQ6uMj21tWR5
 byMbjuZZeCRqjGIcuiZfJO8zzSqXI/OLcBaOfqSF0XtsoYS6cOq+7g5KkBcEoHUZke/ITrFLjQ2
 7PcGa7KcHcZFAF4RkoZzE5JgiU+H6xIxT5x3YSCpskCRx/q5ehF9CTyQN8eHn8abX8l9XpJiAsF
 FdTbvYMvNtYkVGQ1tyBlv0iG/Hk3BvkRBaUP6PWdv8EAkICiHyJ32Ug0IuuA+6XlgUCg/rlwHQk
 y4iEqHfgHog41+w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfX2mc7DBj/hlHx
 +jcWXe4pexLNZhqiJNHWfl677R5xD/GelB5PyEsGEAmfqO9dRkZnkH/Bkvf+C2Id2LKzXJLtGZY
 PcygCdwcASXlagEM0cGFZus0duOyALg=
X-Proofpoint-ORIG-GUID: 0JHmVRvrWl_MKFxeQbpye9e3VZqgRG6L
X-Authority-Analysis: v=2.4 cv=DoTDa2/+ c=1 sm=1 tr=0 ts=6af73109 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=pu8Hlg4PHyDR7New1bsA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfX1fX+DG5mS8Ha
 YiQSbPUJVnS/zVKkUGg4JN5TgQM9ceK0jusYv69V1Mc5gyUgPtfhz1Vk7uWe4H8By1ikOawC851
 ESIqIFEoW7GyJvaiELp4aotQMUbQ+whR+3Zyn+T7ZsTCq0l9JleEzufNztKh8XY2oLhtvtojUEC
 Wt45JJ/VKHWuvWQOoe3i/HAUWkYibpCTvKRuQN6p7muCBElmalaDNGn7yuk6lvr91Fmkop1hVD3
 O5hmP0uvmxQBiQBKYc0L78Fap3iOZF55m6+Ujn6k4wGmtwpiPkj4UV6BBYwFQ3rxIK9olwCLhlE
 aeb7n6A0It3JPRgQhjyugQ4kyKmPfZlNX2BvjI/Bwg6gedeKFH0Yf4d3wqR5i37uX+HrM4a3Z0P
 P1uRj1lDKvaY4uxI25gAHcWI1WM/5aCyZOqRtCtBtl0gMqOUIU+NXej73qTircr/1nJKzBydtPR
 UklbJjPgjmjmTo/h2NA==
X-Proofpoint-GUID: 0JHmVRvrWl_MKFxeQbpye9e3VZqgRG6L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130062

Add a new fwnode callback allowing to count all references of given
firmware node.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/fwnode.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
index 2d7e0b9245d445d473c7317bd27058abe5750b40..15acade60564ddb5f5a48f2235b626466d77dbdf 100644
--- a/include/linux/fwnode.h
+++ b/include/linux/fwnode.h
@@ -137,6 +137,10 @@ struct fwnode_reference_args {
  * @get_parent: Return the parent of an fwnode.
  * @get_next_child_node: Return the next child node in an iteration.
  * @get_named_child_node: Return a child node with a given name.
+ * @count_references: Return the number of references in a property, including
+ *		      empty ones. @nargs_prop names the property in the
+ *		      referenced node holding the number of arguments, if NULL
+ *		      the references have no arguments.
  * @get_reference_args: Return a reference pointed to by a property, with args
  * @graph_get_next_endpoint: Return an endpoint node in an iteration.
  * @graph_get_remote_endpoint: Return the remote endpoint node of a local
@@ -180,6 +184,8 @@ struct fwnode_operations {
 	struct fwnode_handle *
 	(*get_named_child_node)(const struct fwnode_handle *fwnode,
 				const char *name);
+	int (*count_references)(const struct fwnode_handle *fwnode,
+				const char *prop, const char *nargs_prop);
 	int (*get_reference_args)(const struct fwnode_handle *fwnode,
 				  const char *prop, const char *nargs_prop,
 				  unsigned int nargs, unsigned int index,

-- 
2.47.3

