Received: from mail-oo2-f0.google.com (mail-oo2-f0.google.com [74.125.231.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB263909A6
	for <driver-core@lists.linux.dev>; Thu, 17 Sep 2026 23:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789686757; cv=none; b=X3QRsrRaMzb0D57NBsZOMP3M1xsCne6HIaiYTlMG1SmOdiAm4GayN4vBg8Gs6PyGQEOBuk0xaQRerANrAqPXoJLPcyzU2hgc4UogOp9cgOnX2OTp7GlyUhCDKLirpOFfm0gLLKtpIusFY6teWuKvTx1ME0vX1gj9gAFDvXYquzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789686757; c=relaxed/simple;
	bh=N2+u1Dt+48bEQZZGrGiPdh6Oxtzz8M8eeg6pH78Jn10=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=i5QAx8/NnnrUZg1IcONVNMRDJl43++sjn68sgY9LdnYCs5X2PRoYP0Pyj/JKL704CwVQeW5aXvY2aoAiH8NyUGphGrRCo62JEjlAZfZsSAT19p/SJEoI31Gm6BSSwclUJAfVKPMEMpBZmxxwnEsj+GPEl7lFEdqsxq8NiB4Rs3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo2-f0.google.com with SMTP id 006d021491bc7-6a3900cb2b5so81855eaf.0
        for <driver-core@lists.linux.dev>; Thu, 17 Sep 2026 16:12:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789686749; x=1790291549;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3jKujHdzytCKoazkUoSl53S0HLiGT0x/21fG+wCk2jU=;
        b=NSGFImv1XdgWzWlel5s5inxsD5PbYe68v+kyL3iRoQYYGUNW3U7SZ6AI3f8Zsw/ZDU
         OAvdZz9+vKPAmOyRH85OGLAx78e9o6hJ0nOEI1jTnDTEqyEexvuKxIcJ/2l8T4YLa4zD
         GDRANXiNxfcfmC8tOzyApUyngKzAjnO5XE2qcvBDfv+x0ns8XIVSxhsjvR+rM2IoNOIr
         e9nT5K10NlMhlIjY7eLQ53EUqZ695/P6yfLqQD7BM37PMRSpoiRvc7eUiP0aAgft6/b5
         PYsEm4z3867mWJbW+lWiM8AlfDtba0/Ba/ZKkvWZK2+eKztExVNjBsspxw8NPIybCL7R
         jSEg==
X-Forwarded-Encrypted: i=1; AKwUvBzV5SWqzl51L4DMjW/USh1pwLA7UlJFCg0le1uHTGo8p7qI9qlRtLzQWIJGstSy/j+mHOGBMK9CunPn0g==@lists.linux.dev
X-Gm-Message-State: AFuF++njQGi+PY2/QtbqRQERSSCxhYW5DnqvYLM34hHulu488sickHnt
	LwFAzYGmkyjxvO2vp+Nu3N+FUlIs49c9gYKsVBPUUk5Jc2ACujhSEXB8keutZbussnTh+J/oLWG
	ceirP3mnY6Ut2ZqU+i4muzugfDT2mAabYQSUmZPIBlVn3ZqixA3QJ1KxhvYQ=
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1f10:b0:6b7:8415:d77a with SMTP id
 006d021491bc7-6ca9c059d34mr652908eaf.37.1789686749248; Thu, 17 Sep 2026
 16:12:29 -0700 (PDT)
Date: Thu, 17 Sep 2026 16:12:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aac73dd.b398a7c9.1f86be.0026.GAE@google.com>
Subject: [syzbot] [kernel?] BUG: workqueue lockup in request_firmware_work_func
From: syzbot <syzbot+d7795c8487ca4e20ed88@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, mcgrof@kernel.org, rafael@kernel.org, 
	russ.weight@linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot found the following issue on:

HEAD commit:    5445d6419962 arm64: Don't read GMID_EL1 when MTE is disable=
d
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.g=
it for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=3D15bff5f9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D56ed23170c168d4=
c
dashboard link: https://syzkaller.appspot.com/bug?extid=3Dd7795c8487ca4e20e=
d88
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-=
1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D17fa7e1558000=
0
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D141208c9580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/e8b70e3bd109/disk-=
5445d641.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e5227e56ac93/vmlinux-=
5445d641.xz
kernel image: https://storage.googleapis.com/syzbot-assets/54905f78be59/Ima=
ge-5445d641.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit=
:
Reported-by: syzbot+d7795c8487ca4e20ed88@syzkaller.appspotmail.com

BUG: workqueue lockup - pool cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 stuck f=
or 51s!
Showing busy workqueues and worker pools:
workqueue events: flags=3D0x100
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D16 refcnt=3D17
    in-flight: 9:request_firmware_work_func for 117s ,4770:nsim_fib_event_w=
ork for 72s
    pending: 3*nsim_dev_hwstats_traffic_work, 2*psi_avgs_work, vmstat_sheph=
erd, 6*ovs_dp_masks_rebalance, drm_fb_helper_damage_work, psi_avgs_work
  pwq 6: cpus=3D1 node=3D0 flags=3D0x2 nice=3D0 active=3D5 refcnt=3D6
    pending: 2*nsim_dev_hwstats_traffic_work, psi_avgs_work, free_obj_work,=
 delayed_vfree_work
workqueue events_unbound: flags=3D0x2
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D6 refcnt=3D7
    in-flight: 1402:cfg80211_wiphy_work for 68s cfg80211_wiphy_work ,40:cfg=
80211_wiphy_work for 70s cfg80211_wiphy_work ,3330:cfg80211_wiphy_work for =
72s cfg80211_wiphy_work
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D14 refcnt=3D15
    in-flight: 183:linkwatch_event for 71s ,5008:nsim_dev_trap_report_work =
for 0s ,3000:cfg80211_wiphy_work for 72s cfg80211_wiphy_work ,1180:cfg80211=
_wiphy_work for 73s cfg80211_wiphy_work ,54:cfg80211_wiphy_work for 65s cfg=
80211_wiphy_work
    pending: 2*nsim_dev_trap_report_work, toggle_allocation_gate, flush_mem=
cg_stats_dwork, 2*nsim_dev_trap_report_work
workqueue events_power_efficient: flags=3D0x82
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D2 refcnt=3D3
    in-flight: 5009:reg_check_chans_work for 3s
    pending: neigh_managed_work
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D6 refcnt=3D7
    in-flight: 1188:neigh_periodic_work for 13s
    pending: do_cache_clean, fb_flashcursor, neigh_periodic_work, wg_rateli=
miter_gc_entries, gc_worker
workqueue events_dfl_long: flags=3D0x2
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D8 refcnt=3D9
    pending: 8*defense_work_handler
workqueue netns: flags=3D0x6000a
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D1 refcnt=3D4
    in-flight: 58:cleanup_net for 75s
workqueue mm_percpu_wq: flags=3D0x108
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: vmstat_update
workqueue writeback: flags=3D0x4a
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D1 refcnt=3D2
    pending: wb_workfn
workqueue gid-cache-wq: flags=3D0x20002
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D1 refcnt=3D5
    pending: netdevice_event_work_handler
    inactive: update_gid_event_work_handler
workqueue mld: flags=3D0x40108
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D66
    pending: mld_ifc_work
    inactive: mld_dad_work, mld_ifc_work, 3*mld_dad_work, 11*mld_ifc_work, =
mld_dad_work, 2*mld_ifc_work, mld_dad_work, 6*mld_ifc_work, 2*mld_dad_work,=
 12*mld_ifc_work, mld_dad_work, 2*mld_ifc_work, mld_dad_work, 16*mld_ifc_wo=
rk, 2*mld_dad_work, 2*mld_ifc_work
workqueue ipv6_addrconf: flags=3D0x6000a
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D1 refcnt=3D344
    in-flight: 12:addrconf_dad_work for 73s
    inactive: 340*addrconf_dad_work
workqueue bat_events: flags=3D0x6000a
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D1 refcnt=3D48 MAYDAY
    in-flight: 2854(RESCUER):batadv_tt_purge for 4s
    inactive: 2*batadv_tt_purge, batadv_mcast_mla_update, 3*batadv_purge_or=
ig, 2*batadv_iv_send_outstanding_bat_ogm_packet, batadv_purge_orig, batadv_=
iv_send_outstanding_bat_ogm_packet, batadv_mcast_mla_update, 5*batadv_iv_se=
nd_outstanding_bat_ogm_packet, 2*batadv_purge_orig, 6*batadv_iv_send_outsta=
nding_bat_ogm_packet, batadv_dat_purge, batadv_bla_periodic_work, batadv_da=
t_purge, batadv_bla_periodic_work, batadv_dat_purge, batadv_bla_periodic_wo=
rk, batadv_dat_purge, batadv_bla_periodic_work, batadv_dat_purge, batadv_bl=
a_periodic_work, batadv_dat_purge, batadv_bla_periodic_work, batadv_mcast_m=
la_update, 2*batadv_tt_purge, 3*batadv_mcast_mla_update
workqueue udp_tunnel_nic: flags=3D0x20002
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D1 refcnt=3D6
    pending: udp_tunnel_nic_device_sync_work
    inactive: 2*udp_tunnel_nic_device_sync_work
workqueue wg-kex-wg0: flags=3D0x124
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_receive_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x2 nice=3D0 active=3D2 refcnt=3D3
    in-flight: 4955:wg_packet_handshake_receive_worker for 15s
    pending: wg_packet_handshake_receive_worker
workqueue wg-crypt-wg0: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D3 refcnt=3D4
    pending: wg_packet_tx_worker, wg_packet_encrypt_worker, wg_packet_decry=
pt_worker
workqueue wg-kex-wg1: flags=3D0x124
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_receive_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x2 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_receive_worker
workqueue wg-kex-wg1: flags=3D0x6
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D1 refcnt=3D2
    in-flight: 13:wg_packet_handshake_send_worker for 1s
workqueue wg-crypt-wg1: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D3 refcnt=3D4
    pending: wg_packet_tx_worker, wg_packet_encrypt_worker, wg_packet_decry=
pt_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x2 nice=3D0 active=3D1 refcnt=3D3
    in-flight: 4896(RESCUER):wg_packet_decrypt_worker for 0s
    pending: mayday_cursor_func
workqueue wg-kex-wg2: flags=3D0x124
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_receive_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x2 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_receive_worker
workqueue wg-crypt-wg2: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D2 refcnt=3D3
    pending: wg_packet_tx_worker, wg_packet_encrypt_worker
workqueue wg-crypt-wg0: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D3 refcnt=3D4
    pending: wg_packet_tx_worker, wg_packet_encrypt_worker, wg_packet_decry=
pt_worker
workqueue wg-kex-wg1: flags=3D0x124
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_receive_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x2 nice=3D0 active=3D1 refcnt=3D2
    in-flight: 26:wg_packet_handshake_receive_worker for 13s
workqueue wg-crypt-wg1: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D3 refcnt=3D4
    pending: wg_packet_encrypt_worker, wg_packet_decrypt_worker, wg_packet_=
tx_worker
workqueue wg-kex-wg2: flags=3D0x124
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_receive_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x2 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_receive_worker
workqueue wg-kex-wg2: flags=3D0x6
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_send_worker
workqueue wg-crypt-wg2: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D2 refcnt=3D3
    pending: wg_packet_encrypt_worker, wg_packet_tx_worker
workqueue wg-kex-wg0: flags=3D0x124
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_receive_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x2 nice=3D0 active=3D2 refcnt=3D3
    in-flight: 1092:wg_packet_handshake_receive_worker for 25s
    pending: wg_packet_handshake_receive_worker
workqueue wg-kex-wg0: flags=3D0x6
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_send_worker
workqueue wg-crypt-wg0: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D3 refcnt=3D4
    pending: wg_packet_encrypt_worker, wg_packet_tx_worker, wg_packet_decry=
pt_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x2 nice=3D0 active=3D2 refcnt=3D3
    in-flight: 4934:wg_packet_encrypt_worker for 25s wg_packet_encrypt_work=
er
workqueue wg-kex-wg1: flags=3D0x124
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_receive_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x2 nice=3D0 active=3D2 refcnt=3D3
    in-flight: 4840:wg_packet_handshake_receive_worker for 15s
    pending: wg_packet_handshake_receive_worker
workqueue wg-crypt-wg1: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D3 refcnt=3D4
    pending: wg_packet_tx_worker, wg_packet_encrypt_worker, wg_packet_decry=
pt_worker
workqueue wg-kex-wg2: flags=3D0x124
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_receive_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x2 nice=3D0 active=3D2 refcnt=3D3
    in-flight: 24:wg_packet_handshake_receive_worker for 15s
    pending: wg_packet_handshake_receive_worker
workqueue wg-kex-wg2: flags=3D0x6
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_send_worker
workqueue wg-crypt-wg2: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D3 refcnt=3D4
    pending: wg_packet_decrypt_worker, wg_packet_encrypt_worker, wg_packet_=
tx_worker
workqueue wg-crypt-wg0: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D3 refcnt=3D4
    pending: wg_packet_encrypt_worker, wg_packet_tx_worker, wg_packet_decry=
pt_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x2 nice=3D0 active=3D1 refcnt=3D4 MAYDA=
Y
    in-flight: 4914(RESCUER):wg_packet_encrypt_worker for 0s
    pending: mayday_cursor_func
workqueue wg-crypt-wg1: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D3 refcnt=3D4
    pending: wg_packet_decrypt_worker, wg_packet_tx_worker, wg_packet_encry=
pt_worker
workqueue wg-crypt-wg2: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D2 refcnt=3D3
    pending: wg_packet_encrypt_worker, wg_packet_tx_worker
pool 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 hung=3D51s workers=3D8 idle:=
 10 1021 4469 4990 4941 4771
pool 6: cpus=3D1 node=3D0 flags=3D0x2 nice=3D0 hung=3D0s workers=3D7 manage=
r: 866
pool 8: cpus=3D0-1 flags=3D0x6 nice=3D0 hung=3D0s workers=3D14 manager: 501=
0
Showing backtraces of busy workers in stalled worker pools:
pool 2:
task:kworker/0:0     state:R  running task     stack:0     pid:9     tgid:9=
     ppid:2      task_flags:0x4288060 flags:0x00000010
Workqueue: events request_firmware_work_func
Call trace:
 __switch_to+0x2b4/0x6e4 arch/arm64/kernel/process.c:775 (T)
 context_switch kernel/sched/core.c:5520 [inline]
 __schedule+0x1370/0x2d80 kernel/sched/core.c:7270
 preempt_schedule_common+0xd4/0x190 kernel/sched/core.c:7449
 preempt_schedule+0x60/0x78 kernel/sched/core.c:7473
 rcu_read_unlock_sched include/linux/rcupdate.h:974 [inline]
 pfn_valid+0x210/0x214 include/linux/mmzone.h:-1
 lowmem_page_address include/linux/mm.h:3111 [inline]
 __kasan_poison_pages+0x40/0x8c mm/kasan/common.c:151
 kasan_poison_pages include/linux/kasan.h:118 [inline]
 __free_pages_prepare mm/page_alloc.c:1440 [inline]
 __free_frozen_pages+0x4e0/0xc18 mm/page_alloc.c:2962
 free_frozen_pages+0x14/0x20 mm/page_alloc.c:2999
 __free_slab+0x11c/0x1b4 mm/slub.c:3528
 free_slab+0x2c/0x154 mm/slub.c:3562
 discard_slab+0x48/0x90 mm/slub.c:3568
 __slab_free+0x1a0/0x1d0 mm/slub.c:5815
 ___cache_free+0x80/0x94 mm/slub.c:6571
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0xb4/0x120 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x118/0x124 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x2c/0x88 mm/kasan/common.c:350
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4683 [inline]
 slab_alloc_node mm/slub.c:4996 [inline]
 __do_kmalloc_node mm/slub.c:5413 [inline]
 __kmalloc_noprof+0x2e8/0x6c8 mm/slub.c:5439
 _kmalloc_noprof include/linux/slab.h:995 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 kobject_get_path+0xbc/0x2a4 lib/kobject.c:161
 kobject_uevent_env+0x264/0x944 lib/kobject_uevent.c:548
 kobject_uevent+0x2c/0x3c lib/kobject_uevent.c:659
 device_del+0x5f8/0x71c drivers/base/core.c:3983
 fw_load_sysfs_fallback drivers/base/firmware_loader/fallback.c:134 [inline=
]
 fw_load_from_user_helper drivers/base/firmware_loader/fallback.c:172 [inli=
ne]
 firmware_fallback_sysfs+0x330/0x930 drivers/base/firmware_loader/fallback.=
c:248
 _request_firmware+0xb34/0xf5c drivers/base/firmware_loader/main.c:898
 request_firmware_work_func+0xa4/0x24c drivers/base/firmware_loader/main.c:=
1162
 process_one_work kernel/workqueue.c:3387 [inline]
 process_scheduled_works+0x91c/0x1250 kernel/workqueue.c:3470
 worker_thread+0x798/0xbd0 kernel/workqueue.c:3551
 kthread+0x304/0x3d4 kernel/kthread.c:436
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:838
pool 2:
task:kworker/0:4     state:R  running task     stack:0     pid:4770  tgid:4=
770  ppid:2      task_flags:0x4208060 flags:0x00000010
Workqueue: events nsim_fib_event_work
Call trace:
 __switch_to+0x2b4/0x6e4 arch/arm64/kernel/process.c:775 (T)
 context_switch kernel/sched/core.c:5520 [inline]
 __schedule+0x1370/0x2d80 kernel/sched/core.c:7270
 __schedule_loop kernel/sched/core.c:7347 [inline]
 schedule+0x13c/0x20c kernel/sched/core.c:7362
 schedule_timeout+0x13c/0x28c kernel/time/sleep_timeout.c:99
 schedule_timeout_uninterruptible+0x78/0xbc kernel/time/sleep_timeout.c:158
 msleep+0x3c/0x68 kernel/time/sleep_timeout.c:318
 nsim_fib6_rt_add drivers/net/netdevsim/fib.c:693 [inline]
 nsim_fib6_rt_insert drivers/net/netdevsim/fib.c:759 [inline]
 nsim_fib6_event drivers/net/netdevsim/fib.c:856 [inline]
 nsim_fib_event+0x57a0/0x60c4 drivers/net/netdevsim/fib.c:889
 nsim_fib_event_work+0x1d8/0x320 drivers/net/netdevsim/fib.c:1493
 process_one_work kernel/workqueue.c:3387 [inline]
 process_scheduled_works+0x91c/0x1250 kernel/workqueue.c:3470
 worker_thread+0x798/0xbd0 kernel/workqueue.c:3551
 kthread+0x304/0x3d4 kernel/kthread.c:436
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:838


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
