Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795777094;
	b=4l5A+yh5qPev8SCk4YNNQKLBDio6oq12dSWDz2I/yJBBuSBIG+3qLspFKe76WicFs+3Z
	 lYOXPoMZmiyZZjzdCHGT/P0xHYc2HqepcaKYg3F0W4ZsiYJ47iNy4rmF7Nxy//2q85Ww9
	 FmbiE/WpfiZj+Yhkpbw0E5BvvVwl3MQFgehx2S6jcM42ssvRaaDXKzhEmvNp5M1fBD3Wf
	 9yQZ7Q7hY1Fnvt7zBJ15qvymjMvX5iMJJ1yRXC/tlQ06/cLzN/HDensbmpF0+cjrcLMH1
	 1KEpU0ekQ8lRfsbcHnVCJbQrS3e/AEsgV51wkw6QDAmMGI2eU70nmMhsaMdQQ8RRzOg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777094;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MUEQYRgAV1pWb9tB5vVjEtsA48/NCfRo+KnanIYJmp0=;
	b=2HXxnKXlGJ/vqdNKUmQrja4boR8R8sLacFocg949jZNuqxPBxKyGdyTABgJiHAlP/Lwm
	 wW/0zM5/I6QBq8ZlCKgIizCBhD9sa6xZBmf/kI31+smnzl9B+qMSgAY8Mm0xVQLaNGvlH
	 QJg2aGBtveSiVN+LZ9/CA6E1aU9VC225elcbK8aHGgq01I7laPMNW/8NDoLWNh2mYFu+u
	 1dz8rBrZfg5f8h7vlhak9iFcLCv4Hij93fF4GsoDiPqDPRFqlolcasaVny0uUwtAmq+x7
	 73dcFwV0SkVcAVaKjSXCQ7gmnPrP0TINCMIUAbzzvTygBCwU7P3ddKZbB3Kfbz3y+3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EIPwdzux;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DrsxrbD6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABECE606A324
	for <driver-core@lists.linux.dev>; Fri, 27 Nov 2026 10:58:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABECE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EIPwdzux;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DrsxrbD6
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAsHF73609875
	for <driver-core@lists.linux.dev>; Fri, 27 Nov 2026 10:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MUEQYRgAV1pWb9tB5vVjEtsA48/NCfRo+KnanIYJmp0=; b=EIPwdzuxLiV7wGp0
	Vgw4XBiF3kMikABCrnfoXg7XheZJ4Y+85ejcIObB+lz8TROUr3Wadey9HK6LpdoI
	WnVXI3YD/3mGnl8+NFIqcjdd8MXZBF3girBvmO2rszREoJVGhkvtn6ZaMTOti/Dg
	GoHHK/lPYwxY1jOIM+65tDCsuuFXykBSSgiDO/bhBJKxEM3MlVx9MSivxUxXQLxC
	UsDUHWfqn3SVqnWR5jGhq8Kyt55HuQmZkl2K0oz1NdcRYQd3Sk2ibGw3iCC/mXxr
	EZsVbggGtqPv9xc/CE4TMjV22/6We47cmcez88zjMPXVBInxDUYGCYBZYB7QHBYv
	nGNeBQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73dh9a94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 27 Nov 2026 10:58:12 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cde6bb2c56dso4243232a12.0
        for <driver-core@lists.linux.dev>; Fri, 27 Nov 2026 02:58:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795777090; cv=none;
        d=google.com; s=arc-20260327;
        b=O9tMls7yvwU0XV/gKvNJUrYausMrltL99t5EQ2sTXOI20qXWO7iGIwU2AqwSzNPlbp
         RM/YwXHxlSbkOOenkh0c5hz92CpZ4/AFGqG35gvA9eq/xVae9uSaTJbqMviV7Nr0n0n1
         v5Dq5EldkRHOpLheyDNDYZgf6YgBZLPdVDH+6gDYiJ2Z6ryw0x4cVzXroSfgSfubIRfv
         HOoHeYu8elR2K8i7UvS/DpjFcQdoG5h7oWgydNVBiVAokou8RVaC5j7jrka2Mbbva5ZR
         RUDBirlCOfynnxHa4fR7f8iNqaQCWfeGgEzwcJjmWF0J6U52fsXuLUG6FL6GZfr1LR8P
         qLBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MUEQYRgAV1pWb9tB5vVjEtsA48/NCfRo+KnanIYJmp0=;
        fh=xGSxdNEEs4O/hnLV2hyrnkItSjiaCUCmnjnUyCz7yD0=;
        b=QMP9B2gYXH5S4+DVrtyajBzlUgYDH2+GBIKp03Dz9vXhEYluoxAeh90NryTykIEjN8
         I0417i6/bjYxolcjoZlMBhbV1qlsbyBhoukyEQRbroSkE/q778k4jdTGNe/sO+OSWsSu
         jZmTu1P0b3Qe595hOnfStGvQwK31BFJDXq0gU8fAwIY2e8GrrX72SK3s07E06UMiFCvz
         lN8rZnmA3iLK1zhtVdtlCUIYKIPsO09sh+Od5E7Cn9L0nriv2GYuUy8dIQswg/QDeS2O
         9SLAYiKG2/dLRy0OBCTaaZ1r7q2Wj42stOTfQX0Mo6AJA9vR/fFoe/gdPvMpoPMr/2gn
         GUKw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795777090; x=1796381890; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MUEQYRgAV1pWb9tB5vVjEtsA48/NCfRo+KnanIYJmp0=;
        b=DrsxrbD6UhGZYHK9LUJXmZDPAiqXGC+8udlmXPUdcSlpudrz3hU4u/3zXW65LoprAT
         yQ5JrffZOtUX/n1U2/7t6zG34POjhHjdv880JrBfgidOBHKFzdvhS3bbfm9upGX6zOje
         GJRHNHFvoooUd7cgdJ1i20YUowAbmR+HrSgNpQucKJFfVLIUBHLWD24LT0IYZPFQxej4
         urc+kAXqOkyqF8l9kykqiPwXkZRoA16AerNzk888YjIPCNkbF/+vVjVqjFxtWxxD7Fww
         Lfb0JX5tq39iuan9/tDFypeR/+lJrRTyf2A6tK3Dn7OCWo3vdL6Cs4zQEl4HwIQ7XJ38
         dDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795777090; x=1796381890;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MUEQYRgAV1pWb9tB5vVjEtsA48/NCfRo+KnanIYJmp0=;
        b=C71DFwwp8RCzG3diN7txvRbPATQuaJSFT6jqX3dVFIvjT/vnMyIdivferIAOD5c9iu
         L//eHIUkqrYpg/K7qBmoPNWemy5CPC84Auh4oXehxmNS9tvqc+ucjcn63cFw6NDGiXqG
         60SSE2NE1wylSgSOxsy4oc3swqlRvkbYf/LsDo7NOKivGLfxImVS+hSe7LQjBgZEEf43
         W9q/mStfx0PJ6i2U56HTGH3GdxfwWk1bCVkFBP0jkCprYyy/XoDMhCdcSo4l1p5UlOGB
         CU3fXHPP554bSnVAJkZHH6McVFt7J4O/ox5KuDuuE1arXAhyYQWI26NsAB8IlB//9WP9
         hKTw==
X-Forwarded-Encrypted: i=1; AL+hErG1arQL7wvqd50jg3pVj7Fp2+o1KGRgj+tf5x5xy/1QKMXCE6PuAVVfRn/XXJLaoyCxAdBY84G1yHO1zA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9jz8nNRLFEuUeGeuwuAIiTWR+stem/UeFviZXreXyLCf8bl5GL
	1jZ1kkhl9CTMx4x1jgi6ayPYApSUbRJpxQ8RxccmmbTgeKVIBNcj/l+mVKSA50Np3WbFDhul70U
	Nl/E3WsBQve7ZBsQK5RdcBLK4sq0nTy6w88uczdu+1BEAeUj/2SRHG+BOqdYkJnn7MUjdzVdXr0
	ANN7aXKMU57EJq9jUBgrvCW1UZ3lZcawA+VEq3dKu0
X-Gm-Gg: AZFdTZeGG90014olW/G5zHMBhbui2jELA+2GVPttgNeELhZ2paxojuWJrDpZpAtYyYX
	QxveDaEFwtiSDxqCcIsyCCQlB1SHHS8XGzCVN5ESpOvKOmm2WVWIJQGZzvgwwG4fiE7BkO59/pi
	yB/cNcJKRzERPqhPyRvETrNQY2vv+lBSynekR9nB/czSn7MjeetndS93X0tw==
X-Received: by 2002:a05:6a21:32a2:b0:3e2:7a40:a566 with SMTP id adf61e73a8af0-4014d360163mr23482415637.45.1795777090195;
        Fri, 27 Nov 2026 02:58:10 -0800 (PST)
X-Received: by 2002:a05:6a21:32a2:b0:3e2:7a40:a566 with SMTP id
 adf61e73a8af0-4014d360163mr23482388637.45.1795777089644; Fri, 27 Nov 2026
 02:58:09 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261023-pm_attach_by_node-v1-1-4dbaccdf8b0e@ideasonboard.com>
 <CAPx+jO_FC1t_UaDfQDPOCy+V-Zdc1b5h5krrppGvYiW-LsD3LQ@mail.gmail.com> <4fbeef8c-1dc8-4cac-a4af-835037c3dc4b@ideasonboard.com>
In-Reply-To: <4fbeef8c-1dc8-4cac-a4af-835037c3dc4b@ideasonboard.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 11:57:57 +0100
X-Gm-Features: Aa3M54qXtAIHNiGpyOaEyPdRYU5jSSo943VspeWjL8RHDV3sdq5YmHqVLG3NwR0
Message-ID: <CAPx+jO_5OK_9VJo7vh0CP37-fTkd_2j3XtyGkTw3bz4heyYq6Q@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: core: Add genpd_dev_pm_attach_by_node()
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Devarsh Thakkar <devarsht@ti.com>, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0MyBTYWx0ZWRfX/dfMCC6uP/xr
 WgFBZ42tcBSD5NFpGB2OrUiTn2qWBuKfkNpRRl8eflGb9Z9r36yUbI/v/rP0o+izfnFk+6oY/+3
 gYHYy5Eoe/lwJdjyj6PM+fOTLfmz/5RU3eYEjSFrKm3GbJg0TaKnXBXv/z9+HrZbyypvPx0W6Nr
 K7WmA1YgFu8KNriFW3dh3i9RgQqRRPqD+03uuFLdo1ezs8YuscbiUu5sKFlnYaHtcRVbABWjySN
 m/mFtnyW+Dgx6QR34Wo5Luunqlssfyvp39EjpzBSXzeB6zFNfGqEkEw2pbYJR2hH8obQZ9tP1Xv
 eCg5nSMH7MFZmA261WUgpPZ93eI8MQCik2c/PJNUSAzgbu25umGcO9/GqgyYKAaQuq90BWQ770a
 4MAWLBaEa7YINCwV26cXLNVVvREetUdI6/bLmEr92gMvU9l0QzRadIfRAr5JmNdejNbBeBxMgcC
 EaWJRlcCjCmSn4TBj/Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0MyBTYWx0ZWRfXwH/G094l1uZK
 7og9MKbMef2KBQBqBFcCdOpg6GpOnVJ5upCFYCk1lUEd6yFS4bS4EQnhrDsjnMtC0xGlTq+kzcd
 sCVshA8viQl1j2v1sEzFY9+GTpX6vjQ=
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6b096244 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=P1BnusSwAAAA:8
 a=U9_UlU1nMNCvezYFiagA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: a3M3GeDQywHYYpE1gKNweEI_8uyLRBwi
X-Proofpoint-ORIG-GUID: a3M3GeDQywHYYpE1gKNweEI_8uyLRBwi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270043

On Fri, Nov 27, 2026 at 10:07=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> Hi,
>
> On 25/11/2026 14:50, Ulf Hansson wrote:
> > On Fri, Oct 23, 2026 at 8:17=E2=80=AFPM Tomi Valkeinen
> > <tomi.valkeinen@ideasonboard.com> wrote:
> >>
> >> genpd_dev_pm_attach_by_id() and genpd_dev_pm_attach_by_name() attach a
> >> virtual device to a PM domain listed in the OF node of the passed
> >> device.
> >>
> >> Some hardware blocks are described in a child node of a main device.
> >> They have no device of their own, but they do have a PM domain of thei=
r
> >> own. Neither function can attach that domain, as both parse only the O=
F
> >> node of the device.
> >>
> >> An example case is TI's display subsystem and its OLDI (LVDS)
> >> transmitters:
> >>
> >> dss@30200000 {
> >>      power-domains =3D <...>;
> >>
> >>      oldi-transmitters {
> >>          oldi@0 {
> >>              power-domains =3D <...>;
> >>          };
> >>
> >>          oldi@1 {
> >>              power-domains =3D <...>;
> >>          };
> >>      };
> >> };
> >>
> >> The OLDI TX blocks are not part of the DSS IP, but they are not quite
> >> real devices either as they don't have registers of their own, and are
> >> instead controlled via DSS registers.
> >>
> >> Add genpd_dev_pm_attach_by_node(), which is similar to
> >> genpd_dev_pm_attach_by_id() but instead of looking for the power-domai=
ns
> >> from the passed device's DT node, the DT node is passed explicitly. Al=
so
> >> add a matching wrapper function dev_pm_domain_attach_by_node().
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >> ---
> >> This is a new try for managing the OLDI power domains. Previously I
> >> tried using auxiliary device/driver for OLDIs, and handling the PDs th=
e
> >> normal way:
> >>
> >> https://lore.kernel.org/all/20260529-beagley-ai-display-v3-12-7fefdc5d=
1adf%40ideasonboard.com/
> >>
> >> Then I realized an issue, mentioned in
> >> Documentation/driver-api/driver-model/driver.rst: "-EPROBE_DEFER must
> >> not be returned if probe() has already created child devices".
> >
> > I don't follow. How is this a problem? Why not create the child
> > devices at a later point?
>
> The problem the above text refers to is (as far as I understand):
>
> The main driver probes, and creates a child device, which probes
> successfully. That causes the flag for "run deferred probes again" to be
> set. The main driver then continues its probe, but, for some reason,
> must return -EPROBE_DEFER. But as the above-mentioned flag is set, so
> probes are ran again, resulting in the same sequence, again and again.
>
> Creating the child device later is difficult. We have display pipelines
> which contain multiple independent devices. All those devices must have
> probed and their bridges/panels registered to the DRM framework so that
> the main DRM driver can finish its probe. If parts of the pipeline are
> missing, we return -EPROBE_DEFER and wait for the missing parts to appear=
.

Well, I still don't see why creating the child devices later is a
problem. In fact, the opposite seems to be the reason for these
churns.

Usually what we do to solve this kind of problem is to make sure the
main driver for the parent device has completed its operations for the
probe and then it populates the child devices. If that doesn't work
for some reason, the main driver simply needs to remove the child
devices in the error path in the probe.

If the main driver requires the child devices to complete their probe,
an additional synchronization mechanism needs to be added to allow
them to inform the parent.

>
> And the OLDIs here are not really independent devices. They don't have
> register space, and OLDI configuration is done via DSS registers. Yet
> they don't fit very well inside the DSS either, as they are clearly an
> outside IP, an external encoder. So the aim has been to represent them
> as separates child DT nodes, which allows setting OLDI properties and
> the media graph, but there's no compatible string and it's the tidss
> driver that fully manages the creation/cleanup.

I don't see how this is a problem. It's perfectly fine at ->remove()
that the parent should be responsible for removing its children,
right?

>
> Here a simple pipeline could be:
>
> DSS -> OLDI -> panel
>
> If the panel hasn't been registered, tidss will defer. But tidss needs
> OLDI to be there too, when it binds the display pipeline, otherwise it
> could never finish.

I guess "finish" is the important word here. Finish doesn't
necessarily need to be the same thing as that probe completed. This is
what it seems to boil down to.

>
> It is possible to create the DRM bridge entity for the OLDI without any
> OLDI device/driver, which allows creating the display pipeline. But the
> OLDI bridge code has to be able to enable the OLDI power domain, and I
> think the only way to use PDs currently is via devices.

Correct and there are good reasons for that.

>
> So if we created the OLDI DRM bridge as mentioned above, then later in
> tidss probe we could create a device for OLDI, which probes and binds.
> That can then be used to control the PD, but there would be no other use
> for it. And the sequence feels like doing it backwards.

I am not sure this is backwards, at least if we compare with how many
other subsystems/drivers are doing it.

>
> >> The PD virtual devices used in this patch's approach do not hit the
> >> issue as they don't get a driver, so they are not probed. The tidss
> >> driver's OLDI part can then use normal pm_runtime_get/put functions to
> >> manage the OLDI PDs.
> >
> > Sorry, but this makes no sense to me. Considering the above statement
> > about -EPROBE_DEFER and child devices, it sounds like we need to
> > manage some kind of cleanup in both solutions, right?
>
> Yes, but with PD virtual devices there's no probe, so they don't cause
> the "do deferred probes again" flag to be set. It's not the cleanup as
> such that causes the problem.
>
> In some ways this does feel a bit like a work-around to the framework
> limitation. Representing OLDI with the aux-bus feels quite correct, I
> think. But then, all that plumbing just to enable/disable the PD...

Right, but the plumbing sounds quite straightforward, especially since
the auxiliary bus would solve most of the problem for us.

More importantly, I really want to avoid introducing another API for
attaching to power domains.

To solve this I suggest to re-visit the auxiliary device/driver. It's
also important that the created auxiliary device gets its fwnode
assigned to the corresponding child node as in this way, the child
node will also be properly considered for "sync_state" for the
power-domain provider. In regards to the synchronization with the
parent, I suggest providing a platform data for the auxiliary device,
that the auxiliary driver can use to notify the driver for the parent
that it's ready.

>
> So, what I'm basically trying to do in this patch is to provide an API
> that allows enabling/disabling a PD that's not in a DT node managed by a
> Linux device.
>
> > Perhaps if you provide a user of dev_pm_domain_attach_by_node() this
> > becomes more clear.
> I have pushed my branch to korg:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/tomba/linux.git/log/?h=3D=
b4/beagley-ai-display
>
> The commit that uses this patch is:
>
> "drm/tidss: oldi: Add power domain support"
>
> And the dts file that has the OLDI nodes is:
>
> "arm64: dts: ti: k3-am62p-j722s-common-main: Add support for DSS"
>
>   Tomi
>

Kind regards
Uffe
