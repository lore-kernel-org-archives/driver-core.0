Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835303D994
	for <driver-core@lists.linux.dev>; Thu,  2 Jul 2026 06:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782972531; cv=none; b=sa+lRp8Ausn8cgt420cETNgk5o2f6LI1yNJtAUiLrB8iukL/ec38k4PwNx7ZNza04t3RNuoeUZjrB8MNNaNIfnCJ8uWANtgDVWBRzS0+s2WSnYPT1Uuov2ICwcBzuw7SxIGxrv7Sy7LO3ofQnkG5X/NB4VxZoab33Bde/Db6PWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782972531; c=relaxed/simple;
	bh=YWgBvXVXF70bptWYE1RikhsP4a8CbIlb6SjMxl7HeAo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TiS2RL1qK3MC649Ln90xrjH0dDGCJzWVln8Zs8wDrQhEjRgh6NfQn5NJxBU8EIc315Kj/kj/5uqDOEle6dHtsrGvdVNDPt8MzDL8mWtfy5NPTCk7bw2qggzpy9q7gTDk3uRY5rF3uqa+8xldbHIACRzjOQUKm8KBe3Ptbgb7Ums=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EEtvmRRa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uy0XV7SP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EEtvmRRa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uy0XV7SP"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621KSP22957685
	for <driver-core@lists.linux.dev>; Thu, 2 Jul 2026 06:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hcgaK1dgPNDQoQ2Qef50ug40L7J06HDgu6Mo/n3XcK8=; b=EEtvmRRaK0kWVQL8
	wv5z/u9NO1LzFb/wLEM3JLGhMOEdhy3ZSO+hHhbgT1xuI0RmU/GS+SM/E96TH45t
	03P4MQfL6mLH7CqqQeH6zSNIBq0LPBaJptKwkPi/pCAFAGeHiCxeOktnA1Lp4JVE
	4bC7P0mLIk0hKzUBZ8AxTWY3OPrpqHJ68NlUusEqmG2xura1QwKUx1Ua3+2Y5I+r
	0PHgP1MNJbOYcGSb7A7xsBZ6l/uubrf/RysfE7Z28o57X3OCd8NDvw3rXwbFI53P
	cgF4V4/vYQaJM+h1eTMOCSi5m00oET5h8clQvshlfV14kkxZo47sBsXcBNQI9dc8
	Y37N8A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5630aqs1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 02 Jul 2026 06:08:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ca0331d0b1so27108825ad.3
        for <driver-core@lists.linux.dev>; Wed, 01 Jul 2026 23:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782972529; x=1783577329; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hcgaK1dgPNDQoQ2Qef50ug40L7J06HDgu6Mo/n3XcK8=;
        b=Uy0XV7SPh119h6jTKiuJ6BLg9IjnkCHg4gGe1W58+cZODD9ncb7IOLgmj0t7+eaFTH
         +000d+clVQnlX/pqfXcsV/Lov+VVaeTTbMfq/3o6Klqgyt5uaa8FK0JyyYF/1LWRbW4g
         M5tC11AbFOtRHe4qJExUl4+1kcndVgZGiZwulxj7MyPMJcsUfnBsLU5TQZ73T22aovWf
         cBKmkS4Bo/4aS00hYD/jeOHlnlTv0khIfC0gfbiYOecNjeOCSdw3t77IZkmVd9t4/CaY
         +L3V1+QtM5GLy2aGpTgdsJyl5ZwnaY2XNBOE/mfmuZvJYEiCd2pVKeDel20l2ZNeRmPT
         ylcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782972529; x=1783577329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hcgaK1dgPNDQoQ2Qef50ug40L7J06HDgu6Mo/n3XcK8=;
        b=AMkXWqiv4+YoAZ77oLlB2IZwV6WRpUNJPsFOUB4Swi0em/bC8e9IRVGKb8sTYmhG9i
         07ASoAfwlp4WoxLfSFlkh8l9nIeOCSEqmVBaoPXoIpNrpygivFz33IqUy+RVUBd5BgJM
         GLFR6+yVJ6n2twxg6NfTxc0Yy1FWBSKHwhNiXcMH9ROPuWzEA0aEWVBgr6R+hRMcDdgy
         DhTUn09t/uRkWG3xFEdwHudZ7NL9OZic71422eJ4ep2WXHpwBp8+MIoO8/RcyIE/kTpO
         CUY7NzhbKQXQ0Nnt9hhwOGrafRYVq+p2t9MLv+QdJ+ns3LcLD0gaLRd8AdHYXENr1dO+
         HBnA==
X-Forwarded-Encrypted: i=1; AHgh+RrxLhxYdQbQ739ZU7xby7JWRMcJCRs1opf0iFRJQmXCL6W8XQsrfMNxGjSQ3+zswK2v0LGPjU+j0E2ewg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyWum3iKzCZPlMZEEFP4HHMwUD++xfqXq6kGPPv+JNEC2OXLEwO
	UNyCDdiWG1agIN0KlTkf0rlkQYhEW4NbVS36u1ZS7L2erNc4sz2VIdPyxzAgkNFbMjkaInpZJxz
	wNYz1IAZtA5tayD6pCb03fPWB5BNokCDhCqHGeYkkmU4D7MmQHl1SoEYpQ0GP8NecFw==
X-Gm-Gg: AfdE7cnl1x6FpaqXvpUnuJF463l+Aju9QaI/6GaK14r3Gl87YWpX4teEidTl8LX8upx
	R8XAjHUArrodwNrBxOYc24Pgym33Nd+gEFAdjXQpK9PqKfStEgUFNQki/xyHdL2nKRauMCIM3Tf
	bNOtLqqPAZAKSsDREbWPJoKuUY41vWekCPX3zNA+wipKGSAJhaKhjTUhhMHbz8pX6wTGaxl9hU0
	SqMJZFZd4VUYH0mRp4Cr9bMCI7cXf50pKF/XD2sWar0ZTuLw///7aMdzsdpeojjBYcf0xFbTm/f
	b6R0rAl7BKkWbD7KvzaCgreSq5EJI18bUHMZOo5/ORT2gFwUEHRehiAN6EKDUv/jsl7tZ97i/d3
	GqSxw6iSLDC46TBwDntsq98Guc4qgevIwt23X0wrmfMla
X-Received: by 2002:a17:903:291:b0:2c1:f262:4962 with SMTP id d9443c01a7336-2ca7e6da0c0mr47280005ad.20.1782972529042;
        Wed, 01 Jul 2026 23:08:49 -0700 (PDT)
X-Received: by 2002:a17:903:291:b0:2c1:f262:4962 with SMTP id d9443c01a7336-2ca7e6da0c0mr47279405ad.20.1782972528367;
        Wed, 01 Jul 2026 23:08:48 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9aa00970sm8176325ad.71.2026.07.01.23.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 23:08:48 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 11:38:20 +0530
Subject: [PATCH 1/4] PM: runtime: Clear runtime_error on supplier after
 failed get_sync
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-fix_sticky_-einval_after_pm_runtime_api_failure-v1-1-6ddc317011c0@oss.qualcomm.com>
References: <20260702-fix_sticky_-einval_after_pm_runtime_api_failure-v1-0-6ddc317011c0@oss.qualcomm.com>
In-Reply-To: <20260702-fix_sticky_-einval_after_pm_runtime_api_failure-v1-0-6ddc317011c0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782972515; l=1363;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=YWgBvXVXF70bptWYE1RikhsP4a8CbIlb6SjMxl7HeAo=;
 b=eGIuy08vrYVbcIxdGvnJdWobvqVc5GrVZ7OD/RcJlS0vqo02DvksM+Tt0rOqqgYWAVVDl+SBe
 dL8ayeM0rAiBuWv4QyRzFiGt3oWGRwtwUlR27Bje4QrlZB4ffTgSOr6
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Authority-Analysis: v=2.4 cv=JdiMa0KV c=1 sm=1 tr=0 ts=6a460071 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=TbMguNdjUikXwpDzob0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA2MCBTYWx0ZWRfX+kmy4e8C9VG5
 tvwXzNscEfAXgMxpHyGAzQtYdRr+EwqqQk1Ijx4+Pij42oDd7A8b4WcilzkY9qEbvELiVZq5EH5
 idIkjUrN+Pf2fJOfsmbW/U8ieBwUFQg=
X-Proofpoint-ORIG-GUID: rC4Zm284mTr8A-0cEngxH99wZVsbE6r-
X-Proofpoint-GUID: rC4Zm284mTr8A-0cEngxH99wZVsbE6r-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA2MCBTYWx0ZWRfXyG2nCk3Gy1+C
 8oJnV4cid0lsck/3RntFaLqE/QDskfhI0UwFbbQcNK58e0Sbq+2Xp/fgJRGAo9Nuc9AN+MhJ5Gb
 XhdoStdbrE2AwCaVq/1xkrxtIAVGNxyjtxYM7wlvCGxC7XdKtmWN5hrkf48ALcFeqb7+sDS/Nkx
 PEPjdORp9IJwri99LPM63JeEBpY92HUqGOv+ewOZroldv4JX554DhrKikQ+nXvM7GSmk4idfLU1
 yUxQEMbxNuIlHwy6rzkYnwxGspt+bhtNOmDUwtAm0go8PPXGy9LY3t+dp3D75H+CgNujECPjgGn
 fS0Q6sYO5SXASX3qY8z568cw2Wud6ou9Aa+s+Lq8IS0kIU3r3Ium8oiqlmII6Y8pMGIhQfiS+PZ
 2Iyvybx0KSXkY5rXTcrYHu8enYejTH53yfCLv/+OOdmIDDGOgSqLm6xS/VUPDAVqklTfj1k86aT
 q6buvU407P/e7SqfHhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020060

When pm_runtime_get_sync() fails for a supplier device in
rpm_get_suppliers(), the supplier's power.runtime_error field is left
set. This causes any subsequent rpm_resume() call on that supplier to
immediately return -EINVAL at the top of the function without
attempting an actual resume, making the failure permanent until
runtime PM is explicitly re-enabled.

Fix this by calling pm_runtime_set_suspended() on the supplier after
pm_runtime_put_noidle() in the error path. This clears runtime_error
and resets the runtime PM status to RPM_SUSPENDED, allowing the next
consumer resume attempt to retry the supplier resume normally.

Change-Id: Id5067d09caca464f663fc95fe745d037e9c56664
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/base/power/runtime.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index 335288e8b5b3..9811d024d140 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -309,6 +309,7 @@ static int rpm_get_suppliers(struct device *dev)
 		/* Ignore suppliers with disabled runtime PM. */
 		if (retval < 0 && retval != -EACCES) {
 			pm_runtime_put_noidle(link->supplier);
+			pm_runtime_set_suspended(link->supplier);
 			return retval;
 		}
 		refcount_inc(&link->rpm_active);

-- 
2.34.1

