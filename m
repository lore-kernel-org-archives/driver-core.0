Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685800;
	b=vgFVckrSJdA6IRHDnrtqEWVuIfi87oXUI2H15JX3H57woKsjgFFHkUtNAjPCw6FnxhP1
	 x3jh/HVaDxSvlcLhXJzs2kcFnMObMZ1tlZ8JTA3SRAJe4L2Z0U2RJoxvhneDTbgTIAIvD
	 pwuDNCZnD343e55i9wUHm0EQMk5VC7lY0yHjanFzhgN45886xRjSx7A6ybtELSkAiSpTE
	 PYFObharbMWsMBgSnvyxT9P8yU1eMmvdD8klWQFxUbnO/gVrznQuGp5sVWUSme0o9WrM2
	 cRBCHXOFMmcLkEAoE2iT+I+D2GWN+GxRjzAucniU0TeygrLqPqVUJGj0d+8u7Ar+WsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685800;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=itd8Y+uchN2HJrYq4RSPlfZt/iDxc9zWsOFSO8a/jcY=;
	b=ohYtyHeBFNVXvso/sJWfELbU568m3GJlWiUEkjsYYWS4EPTHHCdHnc3GDcBdkHSbuzfq
	 elI6oYYZGblUQlj1z8aj1wlRsGbMBsJLJMNaStUQez1A3j2BQV1vmfnmSyMceLREA8iMM
	 JU15dD3zxF0jZx2Renwh/RShW1BcGNJFop+bW3jeDhBLAJQslA0u2xIrbQebtk2Cqt7kH
	 ny0oYm5KW/GkTJl8GmswVcuMAvRdGdID47FvPosvbt/TWIccBMO3M4xoCnQ0NSEX+SP46
	 pBiDFJ3OS5toS951PNTRvd3lf7R1pg/0hikn4FgNVy63NmR5nqmODuQ4oCE/lffITuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dMy6Z7LM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="NW/u0ilK";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451F4606A335
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 09:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 451F4606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dMy6Z7LM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NW/u0ilK
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7BAbh3548510
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 09:36:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	itd8Y+uchN2HJrYq4RSPlfZt/iDxc9zWsOFSO8a/jcY=; b=dMy6Z7LMWwf5pGPS
	2AZDGdNSbEwYP5I+l/u+WYa/K+2b+NATEAdkvID55tbjesDfb/Vh9ivf1fkK60uz
	ZiOfh0NSJuoh9L5qrNZ4sog0LDFeB35YDjoDkzds3ZfscSLV+W8RE+ShKgB0+7x7
	9Cc7yeOJF6neNT+4s6w52qh6oeUnWo9H+JxLUSBIt2EJmygnK3DOOH5aVAkRJxpX
	R01paHjxLpYs38GU17uT2h7UvBz+2rkdiahWwX/U93IRdvKZfMPAyjCdeboUFe9e
	ukIHNw4JQcZ/eM38akhROmuBhLLdTuB5VJY9bmJd09+YpKQMbhUac+XWWgl4mTYA
	cub1ZA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vauaen-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 09:36:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9308eafb465so1328312785a.2
        for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 01:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795685799; x=1796290599; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=itd8Y+uchN2HJrYq4RSPlfZt/iDxc9zWsOFSO8a/jcY=;
        b=NW/u0ilKRD2yq24dO+JEPoA0dmxZP0sCXr3KXYZs4Uu9Ck3wOoqvlvki9cDTivSylX
         2Cj7CD6b++XMAflLcZ52/EREeDiArgH6bjjYeBMtpBLswaethqdBBkOKJM/F6BPehh+F
         B0O4DIFHW7+/Z4ws2RPskkqPt4/WTZuOyDJrbc+2O9jiM8f4zfFqnGIvzVcC4P2vR//E
         EYLiHLpwK7qcoCVkR2oQoQ0tG7IgiY5DhKSsqUex7kFhePPLPV1Pjfh/hxIqbzHGwzys
         Yjnoifn70tC3JSov7EsKBe8rwHMOtVIaEyZBGr73uEftdrncXKJDkZIEvyObFx+uB9DP
         ahGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685799; x=1796290599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=itd8Y+uchN2HJrYq4RSPlfZt/iDxc9zWsOFSO8a/jcY=;
        b=Fd3QWzooG0w6IUNMlZLb8vLa9DfKaC/crXNOIFp7DYW1CAnMqP35EC1OmmITcjUsaZ
         0rARNhlrOD9qZPR6lHrnwptUQNliedNPchYCdepQDYDsehdWmg0ZkYRTcWmv/Q6LBR8k
         m2neHC67rTXu5xXMYxzfBpBRTOnLrS75bib/xNI10mNCv08j17zBtKma5DmIcYBE2f3d
         5LebL39of1GDQkNZpIh11lc267jUqG1Rw79hHYQj6b1B5dbRYiBMa6J+FHaA/wKCKR35
         JiguxAd8JaI+uQegk3hxcKvWFUSyBU1tQMOOLErLx2dYiThWgvCCnSRlN4iFXKCOoN63
         tB+A==
X-Forwarded-Encrypted: i=1; AL+hErGPbMf1U7Pzn6+dzRN2M4w1rFHYYXfyenFTOkSurhYZVOdo2JS8Qf/ns1gE3olsF+SVlSTvoZWO7sg/Cw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9T6F+riYaQnwbrdjVEbfu21aHkU6CqP56Mrda7DeZ8rW6sXD7g
	YjsuIYuWDgpBtnP1taSV+5Xfgl4at73dH2vkENCDq5njoXrJhFVtZ3d2dSumewNly0tIbCFJNPy
	HIfDEzXTQIpVUYkfAQ+asUSjoqfRfo9bwvut3JD5DqY4hXd+hl+AXE7BTv30P2E/CpA==
X-Gm-Gg: AZFdTZdPzLbKDPZqNa/2NYSrTYU+a0CHiKTsqTZN12P76q0wZb4g7BIYyIDuRbrulMa
	/lJbRB/BDvZZjj2bwyv7gSBBX1DdTN8AMSibosQxI+KFFMxUUuI1RbbDChGK7TzZZUTdB56SVIP
	4qbAPqwJseVsfoXoiQq6j/DtbwU0jvx0DQQqSKy/IsIANO73wp1WwULjxkvpg7XaYBWXY52brar
	65oN0CudXe3dqjKtmr+UlOY37WE8Lp7yha4xcAJ3WKVUDgl5FZ7S5VRAGddhCDZgx+zzcNf94Ry
	8yA73C00Cq/WBXArW1/YHepe7o+h76K8B7fvTlQ8TV0pIZBExK9CH4sesqy5ukpiT70Vaejcy/J
	QjwFaOiUQnAps64yauu4fDh5ulmi367NxF/3LFKp8yR8m6nhzPTV39Rr46bB4cbPDPIrzgl5mUz
	uWew==
X-Received: by 2002:a05:620a:45a2:b0:949:721a:184e with SMTP id af79cd13be357-949ba9cd23bmr3593388885a.36.1795685798544;
        Thu, 26 Nov 2026 01:36:38 -0800 (PST)
X-Received: by 2002:a05:620a:45a2:b0:949:721a:184e with SMTP id af79cd13be357-949ba9cd23bmr3593386085a.36.1795685798129;
        Thu, 26 Nov 2026 01:36:38 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960068fsm227079335e9.4.2026.11.26.01.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:36:37 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 10:36:23 +0100
Subject: [PATCH v4 06/10] fwnode: define the count_references() fwnode
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
Message-Id: <20261126-fwnode-for-each-prop-v4-6-d4b370ecfd52@oss.qualcomm.com>
References: <20261126-fwnode-for-each-prop-v4-0-d4b370ecfd52@oss.qualcomm.com>
In-Reply-To: <20261126-fwnode-for-each-prop-v4-0-d4b370ecfd52@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrB/2U49UIjunv1TUDqXQxjp7bPV2Mn8id84Kjb
 YrUZdyxJnSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawf9lAAKCRAFnS7L/zaE
 w3CpD/9JCHjjxCL5P+FTpe8F2GGiawr3+FVB3NPlSOloMozb1b7V8YXdCjdR1vtoY5la/byNl5H
 D3m4zYV7rlupbToFkuogWz1vb7oGxeyH5t1/4jjU+X+1YBfeLYnW79JPGe+hEVDrq/HMRuJ5mG/
 XeVugSGOznf5XYmyk1XQQJy6djgaGAUmFv0wzzMk5JQQIJVZg++75XfCNnmQb4Jiu1fT4IZNESC
 vsYOwOqolSWhaauDQR2OLx3TTF8ZgViTLFYQ83kQfUkzHpaWTqP1KB0lPl1HW2EodNCDImALT++
 Ie0rIgLExP+blKqJpbyrPmKV4q2EE9pGTrVvQc6wo2IFFLoegext0vrgevpz8WW032VHCkLLkFd
 8nRXwJ+L1uGpuFuNs7ubaE8fgkAvRs+YIzdS70rxIPj2GhVlMkO3kZsk9uCtx75e1+eVTdPBtzd
 0RNZw9i+WHWdI2YEKUWb40peNv3F7jBxJhNYn32e1TxxbNtIK6BJjLOzDVg4fn6R2gW2BKaVaTb
 J4xlE1FiAfsA4vPH/3qWXETHEJwF4sRZWVGYPQlz27ngasIq/NSgGrISDP/xy8d26Guhxf4Dlbi
 X1n/RvSFXGz+63lB8gxMdUIWBm0lCCTSlshoe+XRIYMaAnwtonNdEwgUOobhN5KpKDVUij8UgWF
 bJAT3U7BA/wMT2Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX8F6pIScWVgGI
 PLJ2Kc2TPhl8qHqY+G09bMEh2bwhdKCgg86MnFVIlbBqEPCiRdBhlPNWA5+f9e9pN6uZro9/GG+
 YGMq7LVg39kEDSjwKA4gIyzkDZ0NLrw=
X-Proofpoint-ORIG-GUID: QazWgVN0StNUzDXRzZlaaDM14MqudAkG
X-Proofpoint-GUID: QazWgVN0StNUzDXRzZlaaDM14MqudAkG
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b07fda7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=pu8Hlg4PHyDR7New1bsA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX2dWdNickDjc3
 ZUT0HIt3DWXmGO3pKh9ePfr+ffxHqfcJ/EpCWqcVsZBJ/3QiJU6kl6AVYwElt6gQlX3I2mKZe/V
 9tzVK5LitEmNn1dZ5+DHhW46PIhgyu4vMjge4zfYg++ksvUr3aF0EJi9zPx60ileTI38IDwcNLa
 wH68nfDPE5fUmR4bj4GWK6E6HJynasNEmYldOlr2h0eUIN31VISB1BlTBRFFlcT0jGVUj9gnovX
 Zgl8s2N62vqgMb19NAcWIBpRdsREnb7M0YpYcdBryFvFfQ7zYfHhmm+KHsrC+9w8W1ZSP4c2/s+
 pwUDES8VmdFG+q3gG+LZ430uaOswdqx8MpvKo7mlTT3U60TGmOidpwHNQPi51PZheOBkRqOoZnz
 fqebbhZpNF3ekvmlusbM/XLzV+y+ZWLca093VmKXsOwdThpduoabylEs2Kyev3mbqAXLNTh2b1Z
 caSH8UQkAeC14vmJXzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260037

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

