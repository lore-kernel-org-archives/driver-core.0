Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633128;
	b=iIK8aYCYCGWetKknDHPfeBsbAsL7pGO+6QpargeKhp7pCv5MZybBQri+tfvfSEdh+/dg
	 EJsix9Nyml6Dunpdsu20f7CT3TIdpyuMmLWzkomgbD+px/n6W2V0TXPoihvvMpKe+Ge9U
	 e89FG5/4XX+/cWwM7oYmn1iSBcXY6MWN8glLIX2VioUd4BjId+FwEDnuuXe89PiEc6uNe
	 UkpT9XeEVWgz+0L8LyHznv7Po92VLSDRH4v7aaruvoZzrYV5FLQiuJpmR0sQIUn/o21wx
	 hTN8hCP7MvWPWAc5HX0+mwoY0UBW95dwHhwpN64bwlj4lIF7e1grvyO+pPI4q80/7Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633128;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=B1DU3LgyzTnea9+7Y3O+Bj5uaLiVMEW2UzaRAHeAVXc=;
	b=KNEH7YTXMrrCGGVmfbIDXb/KhohFM0YO+iZD3zi5NG7+Awmvan2CcHlQ25qEEj1CR2Lu
	 kRXAuIvvPl2A6FZZKbRs1PzBxyMwg1aXHgIZjXVfxyYwnaVPxxcPMtgeSrbC9SHh++4LN
	 qdrj4/RBo4t50DTktIOvT6rRbO5AaDBcPuOrOG/TsPli0SQn8CazKvldj0olfCnFF+/B8
	 tD+NrWmD8Rr4vEBfMf+69/iMH+a9YUIiBnz5h0tz6s4xtRFLHsxTPlBR0lsuW8OElMbym
	 BoKGjRimCM7BpCqy+mx/UKJu59ZepC2/8invWcaGCYvFzM41XfAJdMkg8gaHMEkqqUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=myDU0FCZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="gmu/J7jX";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A3B606A90A
	for <driver-core@lists.linux.dev>; Mon,  2 Nov 2026 15:25:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77A3B606A90A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=myDU0FCZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gmu/J7jX
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpQDA3102713
	for <driver-core@lists.linux.dev>; Mon, 2 Nov 2026 15:25:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=B1DU3LgyzTnea9+7Y3O+Bj
	5uaLiVMEW2UzaRAHeAVXc=; b=myDU0FCZNxFZ0+UuUVqd8cbtxPQlaPOIHcckkb
	FdnPCo2ZNxjuZrYkMP9AeKd8mqT2ShdpEsqsHHJEPU3+Vy7uUhHLZn66aI9xdotH
	NPjJrMkLNgFS1Q/KpH0fm/Pb+AxPmv0D84fWWfoFF0LTezhGQtGUrSgM55UY4Ixp
	+7jaK2sqgr/ZHiG7SE260tqRu0jFKP8und/znrsMjfhE7NWCRtu7TEP/M0Hb81Km
	H/AS4CkaBjK62jmKZNB/xlIqyeXgrmBuutiJWiDNqahyLkezf+5NgtrVjos9YAFM
	9wJDxzIfIrN1Onh/g0Pz75m1qHeYZs6tdyTZWcD2g7OIP2Ow==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rjgwp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 02 Nov 2026 15:25:26 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7c0f07b4e81so541152137.2
        for <driver-core@lists.linux.dev>; Mon, 02 Nov 2026 07:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793633125; x=1794237925; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B1DU3LgyzTnea9+7Y3O+Bj5uaLiVMEW2UzaRAHeAVXc=;
        b=gmu/J7jXJzZxdMEY/XxNjzVv1/UbtVSjRJsxBWl0qfCKU/ICeZQQl6WfYvaU+8EBM/
         978eFBsXrUyWrHdY1+FwGQL7VSfBMHHye1e8kPxvyYOBmWM5xz3XoRC5ASdTg1X0xUGF
         upGJ2MLiQN3radx9QV+AKXvdSEyFbSG17fN7tpBfYjRKAoEV1cziJU6zrAXhFDPUSY4o
         JBFh2+rJAkq0RGDBQqnsDZfVmU9YPtPcLqhH7IFv26BBUMZHITFdFG5HteaTlrdYxeOr
         NNmRrfQB2Bx98TSIQGrddESlU+mN1KC7L4Sbjt92yx2jAGpittIhnj5aNRJSwEJqNvOI
         GxUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633125; x=1794237925;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=B1DU3LgyzTnea9+7Y3O+Bj5uaLiVMEW2UzaRAHeAVXc=;
        b=uLhYR2EIkbjHItJCbcTaRDjsDpqchPX7iVjqvGsjssfOg/2lmm+bMwy7FO7Rjalmer
         lNcOxYIf8dhhqeJOfncWSTIZHUS7R9FcOjQJ4fV7vv1dARfWs4oGgHUC2ST6hYMNZGrj
         Yl/rhCwlIWRF4imAHGJlYt+YD/RXZTKL/RLkRsZExIYKmUNUV/3cgElRvwgwS50Fw4Gx
         QshC23D/9DwOIEAsbFGuDfJRDflRyllOOWCg0Isd8s1N9HyzUS1tHrRPkPg/jiyn31E7
         DXZ9x6C0ImN933q5kIMNAA6v5qmpT8bIAgWYCL/U4NI2YNQLDLVd6qO+slH6DeUa9fj8
         ePNg==
X-Forwarded-Encrypted: i=1; AKwUvBzksSuBBGpwBmZ+jEF/EUDZ8bcQIQN/t4ZidyA697dP1OxEN8dLkSqYdyaaGLXxWvQ3DlHBBMZfxpeJgQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+DQITUitawD3bm1ZxQZbMtCl8g9xFAnt2J4xzVsl1EF49ZEp/b
	NbEwUzplUIKHrMa9giCFgEd/1BkRNuzprrHb2izWSwSfCSUIo5UcXTxtpgsyOBMlB5IwDkSvNxe
	hLAzgYToLMGnFTknrcq5F7jp9BJWKZ30N4mB0lZb4zEWHizsmiHkWyMYrAUhrCdIcIQ==
X-Gm-Gg: AYBFou1iZFweACp+ddrqEUV4b+EpSl0j/z5ApL703NtT1Q2d/CVMQs03zRFoa7CM5k4
	lbPZIvPBstbQtyJsG5cTiAabCPPGwJoVna57QvtAbPOQHNUhGn1u9YG3qUttbHvJb8206yrhW2M
	6lfSLWm8ohUfW2t9/kIwJKW+/2cCWnA6NQZ7ghqHX90j9YhIwDzei5nhdZ4tAHTj7lcFkUc6cde
	TxqiLegKxj7zlL831Fvb2SWOwzPfWad0yrL8ShRrFM/WH08CyYUr7dWBVjzXKQ6dKuKnUTX6e8n
	mzuXfX12y3bvJx1IWHQFcz+ffyK5CMtay0lbPZ4OGdHmhJuO83bwA3yUfYfARAMezjmHVxFI58j
	W3O9oNyLx4hiXTIS3+lW+9cN63PlKrAs3Lu+2u7d9Ym66Xm3d12mJpIA36GH7hkaPP1Q21wGk4H
	ZHCw==
X-Received: by 2002:a05:6102:6883:b0:7a7:5355:7fb6 with SMTP id ada2fe7eead31-7d07267f930mr3504250137.24.1793633125453;
        Mon, 02 Nov 2026 07:25:25 -0800 (PST)
X-Received: by 2002:a05:6102:6883:b0:7a7:5355:7fb6 with SMTP id ada2fe7eead31-7d07267f930mr3504234137.24.1793633124952;
        Mon, 02 Nov 2026 07:25:24 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8a5a7sm21652200f8f.37.2026.11.02.07.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:25:24 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 16:25:16 +0100
Subject: [PATCH] software node: only let the owner release a managed node
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
Message-Id: <20261102-swnode-only-owner-release-v1-1-ee4c9022a629@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFur6GoC/x3MQQqDQAxG4atI1g2YsVXoVUoX4vy2AcmUBKoi3
 r1Dl9/ivYMCrgi6Nwc5vhparEIuDU3v0V5gzdWU2tSLtIljtZLBxZady2pwdiwYA3y9Yc7TIKm
 DUO0/jlm3//vxPM8fZWxn+2sAAAA=
X-Change-ID: 20261102-swnode-only-owner-release-45efdc7123e1
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3090;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZleP3PDhw48f6cSLIdCsOL2mkkUrCTAfo49Savej+/g=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6KtgROPX0Epo5EG5AuMUFPtRwBKX3Zpzdmuat
 gzc/czvDxKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauirYAAKCRAFnS7L/zaE
 w0zgD/9HdeUt+9DhTQ+gmK2a/h1PphwvGSXwJr5tJ8k4iV+a5lZuUw5zHNgYZVba6pPQODBuSUn
 ICF6icCO/T0PD+Yn4HxOeeeH2UxCfifc6pltgu+D8bxLjCAaM+KVwT8HEgGoyRRz7wczL8NioXf
 Qw3GDFZ5DOsd330nle7vnIg4JHusBCGL5SBU46P23MUssjLL26JLQI/8LCAOEZcJO6SMevDOxCt
 5VrRXW7yIrpn0Zru+r4GEkR6o4NnZYiibBzmlJ2PK3lZWka/qeTiZx4to8jrle/Fr47E4F8EQd+
 bcYJqTUtfMhjwEUTDpQhfJxlvebUAFzlfFvVolhg6pOchiDNh9tfHx8ywM32PcrXf2Q1u9dF3P3
 S1YeuQI5ULGuVM+M+le8YzOKFqfSJSAyMB8FCISZREWeuDOCL7cCzh57jByottXRJukxQpnI75i
 PdGir0BvyPHBS+Rt+Jyvofz/EyxBxE0lXFF3o1IgnY6IYp5XpUd0u3DDOvrY/SBQwu/ZK4J7p5n
 sidjlciuvQAGNj8vxqEwVHjGonti2CWrHxVXVNlbEcusqBQ1VPIeXbCnmwh8BN9xLVXNwAKSE8N
 J2ioIR7vJE0vgbBElce+ej6gNYFx5H5B8r0/kFgj3h/ba92e4TdOq2cq+8P99AErSHzIzsumBbY
 fKvj+C7zZ4qCunw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: uj1UBNuixyorIWWqjAxvk4piSpbic1KR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MSBTYWx0ZWRfXzmy3KRPDp1/V
 gImbOXFOpYoj4zJDfB8XLHtOuJYLSmvICGQ6xwtyjv9dIcW7FncjwwbfjZJmdPmtxNpTzz5XKAz
 hyX8eR/pq+KIha4YVloF7NlL96C9tXA16bYXrP1bo1ZsqRxnBm3DssgaankLV6Z417SYvwp6pbc
 dclOfFwqwj3QvTMzZcKABKu8hkFQnIBNNM298lKandEXf2uwB1lcyuq5s9CjftyU/GQmT2WOx4/
 3lxUopUv2ZCHWOOwVtzZmlSXiVzt83TR2FuqJFd6lDrvPSDtrP3VOUkqhAFwgALqhNhP8/FJvSe
 BWzcku0mZeGv+4TupymYIG7eo2Dttmeu4+6U/ESpwxxK0sc37q9TlIvn7eSdvvlypaI+dV/4Ysr
 zzPtZCzQx0FJblysyxHS8pnqyyhiUwR01T9Je4VJlKjXAclc5s0NM5YknDWxcGAxVBYEcnUrR/k
 MFOv2s99sQW6cwdcc0Q==
X-Proofpoint-GUID: uj1UBNuixyorIWWqjAxvk4piSpbic1KR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MSBTYWx0ZWRfX0lmbkm93Jap6
 sBW6I0q1zNiU4bJ0A029ZBs9XCSjT02f8+O+iBgeMMVbIYSTFTr+Zu5lL0xRUWWTqSgQJpOM92g
 ixcV9NCtmJLDq8FG8fS03OV2oPxYQIA=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae8ab66 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=fRiVfNsCqIIJhZuQGKsA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020061

device_create_managed_software_node() creates a node whose lifetime is
tied to the device it was created for. software_node_notify_remove() is
called for every device that has the node as its fwnode (primary OR
secondary) and, if the node is managed, unconditionally detaches it from
that device and drops the creation reference.

This breaks when the node is shared with another device. Example: the
i2c-designware copies the parent's fwnode to the adapter's struct device.
When the adapter is deleted, it releases the reference that belongs to
the owner and the latter ends up with a dangling pointer.

Record the device's "manager" and only perform the actual release when
notify is called for that "owner" device.

Reported-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Closes: https://lore.kernel.org/all/20261009164241.923756-2-balasubramani.vivekanandan@intel.com/
Fixes: 151f6ff78cdf ("software node: Provide replacement for device_add_properties()")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Hi!

This is my approach at addressing the bug reported by Vivekanandan
directly in driver core. Please test it if you can.

Thanks,
Bartosz
---
 drivers/base/swnode.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 84a77ffa3dc4bbcca62bbe67c3390693500b01ea..abb6d6d59d59cb4e605fc31cc7e89f92e9f900a6 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -29,6 +29,8 @@ struct swnode {
 	struct fwnode_handle fwnode;
 	const struct software_node *node;
 	int id;
+	/* Device the managed node's lifetime is tied to. */
+	struct device *owner;
 
 	/* hierarchy */
 	struct ida child_ids;
@@ -37,7 +39,6 @@ struct swnode {
 	struct swnode *parent;
 
 	unsigned int allocated:1;
-	unsigned int managed:1;
 };
 
 static DEFINE_IDA(swnode_root_ids);
@@ -1145,7 +1146,7 @@ int device_create_managed_software_node(struct device *dev,
 	if (IS_ERR(fwnode))
 		return PTR_ERR(fwnode);
 
-	to_swnode(fwnode)->managed = true;
+	to_swnode(fwnode)->owner = dev;
 	set_secondary_fwnode(dev, fwnode);
 
 	if (device_is_registered(dev))
@@ -1190,6 +1191,7 @@ void software_node_notify(struct device *dev)
 void software_node_notify_remove(struct device *dev)
 {
 	struct swnode *swnode;
+	bool is_owner;
 
 	swnode = dev_to_swnode(dev);
 	if (!swnode)
@@ -1206,9 +1208,13 @@ void software_node_notify_remove(struct device *dev)
 	if (!device_match_fwnode(dev, &swnode->fwnode) && swnode->fwnode.dev == dev)
 		swnode->fwnode.dev = NULL;
 
+	is_owner = swnode->owner && swnode->owner == dev;
+	if (is_owner)
+		swnode->owner = NULL;
+
 	swnode_put(swnode);
 
-	if (swnode->managed) {
+	if (is_owner) {
 		set_secondary_fwnode(dev, NULL);
 		swnode_put(swnode);
 	}

---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
change-id: 20261102-swnode-only-owner-release-45efdc7123e1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

